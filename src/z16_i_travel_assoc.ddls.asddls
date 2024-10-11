@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Association'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity z16_i_travel_assoc
  as select from Z16_I_flight as f
  association to Z16_I_connection as _Connection on  $projection.CarrierId    = _Connection.CarrierId
                                                 and $projection.ConnectionId = _Connection.ConnectionId
{
  key f.CarrierId,
  key f.ConnectionId,
  key f.FlightDate,
      f.Price,
      f.CurrencyCode,
      f.PlaneTypeId,
      f.SeatsMax,
      f.SeatsOccupied,
      _Connection
      //_Connection.AirportFromId
}
