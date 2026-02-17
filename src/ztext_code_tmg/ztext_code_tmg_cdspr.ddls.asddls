@EndUserText.label: 'Projection  Data Defination for Text Code TMG'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZTEXT_CODE_TMG_CDSPR
  provider contract transactional_query
  as projection on ZTEXT_CODE_TMG_CDS
{

  key TaxCode,
  key TransactionKey,
  key ConditionType,
      Description,
      Percentage

}
