@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View für RAP'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z16_437_C_TRAVEL
  as projection on Z16_437_I_TRAVEL
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Lastchangedby
}
