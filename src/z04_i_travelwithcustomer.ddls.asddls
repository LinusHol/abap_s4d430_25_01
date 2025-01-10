@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'travel_with_customer'


define view entity Z04_I_TravelWithCustomer
  as select from /dmo/customer
    inner join   /dmo/travel                                                  on /dmo/customer.customer_id = /dmo/travel.customer_id
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS') on  /dmo/travel.status                     = DDCDS_CUSTOMER_DOMAIN_VALUE_T.value_low
                                                                              and DDCDS_CUSTOMER_DOMAIN_VALUE_T.language = $session.system_language
{

  key /dmo/travel.travel_id                                               as TravelId,
      /dmo/travel.begin_date                                              as BeginDate,
      /dmo/travel.end_date                                                as EndDate,
      dats_days_between(/dmo/travel.begin_date, /dmo/travel.end_date) + 1 as Duration,
      @Semantics.amount.currencyCode: 'CastedBookingFee'
      currency_conversion( amount => /dmo/travel.booking_fee,
      source_currency => /dmo/travel.currency_code,
      target_currency => $projection.CurrencyCode,
      exchange_rate_date => /dmo/travel.begin_date,
       error_handling => 'KEEP_UNCONVERTED' )                             as NewBookingFee,
      cast('EUR' as abap.cuky)                                            as CastedBookingFee,
      @Semantics.amount.currencyCode: 'CastedTotalPrice'
      currency_conversion( amount => /dmo/travel.total_price,
      source_currency => /dmo/travel.currency_code,
      target_currency => cast('EUR' as abap.cuky ),
      exchange_rate_date => /dmo/travel.begin_date,
      error_handling => 'KEEP_UNCONVERTED')                               as NewTotalPrice,
      cast('EUR' as abap.cuky)                                            as CastedTotalPrice,
      /dmo/travel.currency_code                                           as CurrencyCode,
      /dmo/travel.description                                             as Description,
      /dmo/travel.status                                                  as Status,
      case /dmo/travel.status
      when 'B' then 'Booked'
      when 'P' then 'Planned'
      when 'X' then 'Cancelled'
      when 'N' then 'New'
      else ''
      end                                                                 as StatusText,
      /dmo/customer.customer_id                                           as CustomerId,
      concat_with_space
         (concat_with_space(
             /dmo/customer.title,
             /dmo/customer.first_name, 1),
                 /dmo/customer.last_name, 1)                              as CustomerName,
      /dmo/customer.street                                                as Street,
      /dmo/customer.postal_code                                           as PostalCode,
      /dmo/customer.city                                                  as City
}
where
  /dmo/customer.country_code = 'DE'
