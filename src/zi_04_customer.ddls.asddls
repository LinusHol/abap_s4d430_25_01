@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer'

define view entity ZI_04_Customer as select from /dmo/customer
{
  key customer_id as CustomerId,
  first_name as FirstName,
  last_name as LastName,
  city as City,
  country_code as CountryCode,
  phone_number as PhoneNumber,
  email_address as EmailAddress
}
