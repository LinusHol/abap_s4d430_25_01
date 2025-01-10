@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 1: Projections and Selections'
define view entity Z_04_Demo01
  as select from /dmo/flight
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      price          as Price,
      currency_code  as CurrencyCode,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}
