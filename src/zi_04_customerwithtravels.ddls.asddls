@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer with travels'

define view entity ZI_04_CustomerWithTravels as select from ZI_04_Customer

association [0..*] to /dmo/travel  as _Travels on  ZI_04_Customer.CustomerId  = _Travels.customer_id



{
  key CustomerId,
  FirstName,
  LastName,
  City,
  CountryCode,
  PhoneNumber,
  EmailAddress,
  
   _Travels
}
