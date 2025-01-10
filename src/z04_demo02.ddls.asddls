@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 2: Joins'


define view entity Z04_Demo02
  as select from /dmo/connection
    inner join   /dmo/flight on  /dmo/connection.carrier_id    = /dmo/flight.carrier_id
                             and /dmo/connection.connection_id = /dmo/flight.connection_id
    inner join /dmo/carrier on /dmo/connection.carrier_id = /dmo/carrier.carrier_id
{
key /dmo/connection.carrier_id as CarrierId,
key /dmo/carrier.name as CarrierName,
key /dmo/connection.connection_id as ConnectionId,
key /dmo/flight.flight_date as FlightDate,
/dmo/connection.airport_from_id as AirportFromId,
/dmo/connection.airport_to_id as AirportToId,
/dmo/connection.departure_time as DepartureTime,
/dmo/connection.arrival_time as ArrivalTime,
/dmo/flight.price as Price,
/dmo/flight.currency_code as CurrencyCode,
/dmo/flight.plane_type_id as PlaneTypeId,
/dmo/flight.seats_max as SeatsMax,
/dmo/flight.seats_occupied as SeatsOccupied
  }
