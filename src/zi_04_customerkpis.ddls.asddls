@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer KPIs'
define view entity ZI_04_CustomerKPIs as select from Z04_I_TravelWithCustomer
{
   
   key CustomerId,
   CustomerName,
   Street,
   PostalCode,
   City,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   sum (NewTotalPrice + NewBookingFee) as TotalRevenue,
   CurrencyCode,
   @Semantics.amount.currencyCode: 'Currencycode'
   avg (Duration as abap.dec(16,0)) as AverageDuration,
   count (distinct City) as NumberOfDifferentCities
   }
   group by 
   CustomerId,
   CustomerName,
   Street,
   PostalCode,
   City,
   CurrencyCode
   having
   (sum(NewTotalPrice + NewBookingFee)) > 50000
   
