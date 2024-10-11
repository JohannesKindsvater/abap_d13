@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EmployeeQuery'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z16_C_EMPLOYEEQUERY
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats
  as select from Z16_R_EMPLOYEE
{
  key EmployeeId,
      firstName,
      lastName,
      DepartmentId,
      CurrencyCode,
      _Department.Description                                                                                as DepartmentDescription,
      //      _Department._DepmentAssistant.lastName as AssistantName,
      concat_with_space (_Department._DepmentAssistant.firstName, _Department._DepmentAssistant.lastName, 1) as AssistantName,
      case EmployeeId
      when _Department._DepmentAssistant.EmployeeId then 'H'
      when _Department._DepmentAssistant.EmployeeId then 'A'
      else ''
      end                                                                                                    as EmployeeRole,
      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      currency_conversion( amount => AnnualSalary,
      source_currency => CurrencyCode,
      target_currency => $projection.currencycode,
      exchange_rate_date => $parameters.p_date )                                                             as AnnualSalaryConverted,
      @EndUserText.label: 'Montly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      ( cast( $projection.AnnualSalaryConverted as abap.fltp )) / 12.0                                       as MonthlySalaryConverted,
      //      CurrencyCode
      cast( 'USD' as /dmo/currency_code )                                                                    as CurrencyCodeUSD,

      /* Associations */
      //      dats_days_between ( EntryDate, $session.system_date )                                                  as CompanyAffiliation
      division (dats_days_between ( EntryDate ,$session.system_date), 365, 1)                                as CompanyAffilitation
      //_Department
}
