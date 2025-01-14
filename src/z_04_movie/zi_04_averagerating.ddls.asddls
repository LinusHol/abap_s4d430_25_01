@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AverageRating'
define view entity ZI_04_AverageRating as select from ZR_04_Rating
{
  key MovieUuid,
  @EndUserText: {label: 'Average Rating', quickInfo: 'Average Rating'}
  avg(Rating as abap.dec(4,1)) as AverageRating
}
group by
  MovieUuid

