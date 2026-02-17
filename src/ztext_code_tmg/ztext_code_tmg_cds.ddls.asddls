@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Defination for Text Code TMG'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZTEXT_CODE_TMG_CDS as select from ztext_code_tmg
{
    key taxcode as TaxCode,
    key transaction_key as TransactionKey,
    key conditiontype as ConditionType,
    description as Description,
    percentage as Percentage
}
