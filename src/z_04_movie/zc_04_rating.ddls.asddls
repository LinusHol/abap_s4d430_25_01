@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true
define view entity ZC_04_Rating as projection on ZI_04_Rating
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  /* Associations */
  _Movie: redirected to parent ZC_04_Movie
}
