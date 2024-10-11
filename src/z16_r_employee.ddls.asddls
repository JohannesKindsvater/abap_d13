//@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AbapCatalog:{
  dataMaintenance: #DISPLAY_ONLY,
  viewEnhancementCategory: [#NONE]
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #D,
  sizeCategory: #M,
  dataClass: #MASTER
}
define view entity Z16_R_EMPLOYEE
  as select from /lrn/employ_dep
  association [1..1] to Z16_R_DEPARTMENT as _Department on  $projection.DepartmentId = _Department.Id
{
  key employee_id   as EmployeeId,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      annual_salary as AnnualSalary,
      first_name as firstName, 
      last_name as lastName,
      @EndUserText.label: 'Currency Key'
      currency_code as CurrencyCode,
      department_id as DepartmentId, 
      entry_date as EntryDate,
      _Department
}
