@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS_VIEW_DEPARTMENT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z16_R_DEPARTMENT
  as select from z16depment2
    association [0..*] to Z16_R_EMPLOYEE as _Employee on  $projection.Id = _Employee.EmployeeId 
    association [0..1] to Z16_R_EMPLOYEE as _DepmentHead on  $projection.DepartmentHead = _DepmentHead.EmployeeId
    association [1..1] to Z16_R_EMPLOYEE as _DepmentAssistant on  $projection.DepartmentAssistant = _DepmentAssistant.EmployeeId
{
  key id                    as Id,
      description           as Description,
      department_head       as DepartmentHead,
      department_assistant  as DepartmentAssistant,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      department_head as DepHead,
      department_assistant as DepAssistant,
      _Employee,
      _DepmentAssistant,
      _DepmentHead
}
