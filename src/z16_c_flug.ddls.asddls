@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'JOIN'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z16_c_flug
  as select from Z16_I_flight     as f
    inner join   Z16_I_connection as c on  f.CarrierId    = c.CarrierId
                                       and f.ConnectionId = c.ConnectionId
{
  key f.CarrierId,
  key f.ConnectionId,
      f.Price,
      f.CurrencyCode,
      f.PlaneTypeId,
      f.SeatsMax,
      f.SeatsOccupied,
      c.AirportFromId,
      c.AirportToId,
      c.DepartureTime,
      c.ArrivalTime,
      c.Distance,
      c.DistanceUnit
}
