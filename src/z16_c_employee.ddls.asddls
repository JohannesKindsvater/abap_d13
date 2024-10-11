@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-VIEW-2'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
  serviceQuality: #D,
  sizeCategory: #M,
  dataClass: #MASTER
}
define view entity Z16_C_EMPLOYEE as select from Z16_R_EMPLOYEE
{
  key EmployeeId,
  AnnualSalary,
  CurrencyCode
}
