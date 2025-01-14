@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
define root view entity ZI_04_Movie
  as select from ZR_04_Movie
  association [0..1] to ZI_04_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  composition [0..*] of ZI_04_Rating        as _Ratings
{
  key MovieUuid,
      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /*Transient Data*/

      _AverageRating.AverageRating as AverageRating,
      case when $projection.AverageRating > 5.9 then 3
           when $projection.AverageRating > 4.5 then 2
           when $projection.AverageRating > 0 then 1
           else 0
      end                          as AverageRatingCriticality,

      /*Associations*/

      _Ratings

}
