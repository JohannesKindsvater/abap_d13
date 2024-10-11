@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-VIEW-FLIGHTS-2'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z16_FLIGHTS_2
  as select from Z16_FLIGHTS
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied
}
where
  CarrierId = 'LH'
