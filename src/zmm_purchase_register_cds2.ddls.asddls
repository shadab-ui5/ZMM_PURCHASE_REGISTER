@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZMM_PURCHASE_REGISTER_CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_PURCHASE_REGISTER_CDS2 as select distinct from ZMM_PURCHASE_REGISTER as a
       left outer join I_MaterialDocumentHeader_2 as b on ( 
        b.MaterialDocument          = a.migo_Docno
        and b.MaterialDocumentYear  = a.FiscalYear 
       
       
       )
        left outer join  I_Materialledgercube_Lit as c  on(
       c.ReferenceDocument             = a.migo_Docno
       //and c.CompanyCode               = a.CompanyCode
       and c.LedgerFiscalYear                   = a.FiscalYear
       and c.Material        = a.material
       and c.Ledger = '0L'
     )
     left outer join       I_GLAccountText      as d  on(
       d.GLAccount    = c.GLAccount
       and d.Language = 'E'
       )
{
    key left ( a.miro_doc, 10 ) as miro_doc,
    key a.miro_postingdate,
    key a.journalentry_no,
    key a.journalentry_item,
    a.materialType,
    a.material,
    a.material_desc,
    a.HSNCode,
    a.HSNCode_Desc,
    a.Plant,
    a.PurchasingDocument,
    a.PurchasingDocumentItem,
    a.ProfitCenter,
    a.MasterFixedAsset,
    a.AccountingDocumentType,
    a.miro_docdate,
    a.miro_Refno,
    a.migo_Docno,
    b.PostingDate as migo_Docno_date, 
    a.VendorCode,
    a.VendorName,
    a.PanNumber,
    a.VendorMSME,
    a.Vendor_GSTIN,
    a.StateCode,
    a.StateCode_Desc,
    c.GLAccount as MIGO_GL1,
    d.GLAccountLongName as MIGO_GL_D,
    a.miro_gl,
    a.miro_glname,
    a.Miro_item_taxCode,
    a.Miro_item_taxCode_dec,
    @Semantics: { quantity : {unitOfMeasure: 'BaseUnit'} }
    a.miro_Qty,
    a.BaseUnit,
    @Semantics.amount.currencyCode: 'DocumentCurrency'
    a.POItem_rate,
    a.DocumentCurrency,
    @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
    a.BasicAmount,
    a.CompanyCodeCurrency,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.CGST,
    a.CGST_rate,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.SGST,
    a.SGST_rate,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.IGST,
    a.IGST_rate,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.tcs_amount,
    @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
    a.Revised_bas_exclud_GstAmt,
    a.Non_cr_cgst,
    a.Non_cr_sgst,
    a.Non_cr_igst,
    a.Total_Amount,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.TDS_VALUE,
    a.BillAmt_afterTDS,
    a.tds_gl,
    a.tds_gl_desc,
    a.TransactionCurrency,
    a.WeightUnit,
    @Semantics.quantity.unitOfMeasure: 'WeightUnit'
    a.NetWeight,
    a.Netweight_tot_Qty, 
    a.GrossWeight,
    a.net_weight_unit,
    a.CityName,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.freight_amount,
    a.miro_header_text,
    a.miro_lineItem_text,
    a.miro_BusinessPlace,
    a.RCM_flag,
    a.Eligibility_ind,
    a.Common_supply_ind,
    a.DocumentType,
    a.originalDocument,
    a.PaymentDueDate,
    a.VendorStatus,
    a.Type

 
 
 }

