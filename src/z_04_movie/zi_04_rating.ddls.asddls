@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_04_Rating as select from ZR_04_Rating
association to parent ZI_04_Movie as _Movie
  on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  _Movie 
}
