@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Genre'
define view entity ZI_04_GenreVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T (p_domain_name: 'ZABAP_GENRE')
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @UI.hidden: true
  key language,
      @EndUserText: {label: 'Genre', quickInfo: 'Genre'}
      value_low as Genre,
      @EndUserText: {label: 'Genre', quickInfo: 'Genre Text'}
      text      as GenreText
}
