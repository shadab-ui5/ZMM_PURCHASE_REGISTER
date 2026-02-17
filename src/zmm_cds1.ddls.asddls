@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMM_CDS1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_CDS1 as select from I_PurchaseOrderHistoryAPI01 as b 
left outer join I_SupplierInvoiceAPI01 as a on ( a.SupplierInvoice = b.PurchasingHistoryDocument
                                                         )
left outer join I_OperationalAcctgDocItem as AA on  ( AA.CompanyCode = a.CompanyCode and AA.FiscalYear = a.FiscalYear and AA.OriginalReferenceDocument = a.SupplierInvoiceWthnFiscalYear and AA.PurchasingDocument = b.PurchaseOrder and AA.PurchasingDocumentItem = b.PurchaseOrderItem 
                                                     and  AA.TransactionTypeDetermination = 'WRX'        )                                                         
{
    b.ReferenceDocument,
    b.ReferenceDocumentItem,
    b.PurchasingHistoryDocument ,
    b.PurchasingHistoryDocumentItem ,
    @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
    b.InvoiceAmtInCoCodeCrcy ,
    a.SupplierInvoiceStatus ,
    AA.PurchasingDocument,
    AA.PurchasingDocumentItem,
    a.CompanyCode,
    a.FiscalYear,
    a.PostingDate ,
    a.DocumentDate ,
    a.SupplierInvoiceWthnFiscalYear,
    a.SupplierInvoice,
    a.SupplierPostingLineItemText,
    b.PurchaseOrder,
    b.PurchaseOrderItem,
    a.SupplierInvoiceIDByInvcgParty,
    a.DocumentHeaderText,
    a.DueCalculationBaseDate,
    a.DocumentCurrency,
    @Semantics.amount.currencyCode: 'DocumentCurrency'
    a.InvoiceGrossAmount,
    a.InvoicingParty,
    b.CompanyCodeCurrency,
    @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
    b.InvoiceAmtInCoCodeCrcy as Invoicevalue,
    b.Currency,
    @Semantics.amount.currencyCode: 'Currency'
    b.PurchaseOrderAmount,
    b.TaxCode,
    AA.TaxItemGroup,
    a.ReverseDocument,
    a.InvoiceReference,
    b.DocumentDate as purchasinghistorydate
   
    
    
}
 where 
   a.ReverseDocument = '' and a.ReverseDocumentFiscalYear = '0000'
   and b.PurchasingHistoryCategory <> 'E'  and b.PurchasingHistoryCategory <> 'O' and b.PurchasingHistoryCategory <> 'N' and b.DebitCreditCode = 'S'
   group by 
    b.ReferenceDocument,
    b.ReferenceDocumentItem,
    b.PurchasingHistoryDocument ,
    b.PurchasingHistoryDocumentItem ,
    b.InvoiceAmtInCoCodeCrcy ,
    b.PurchasingHistoryDocument,
    a.SupplierInvoiceStatus ,
    a.SupplierInvoiceWthnFiscalYear,
    a.PostingDate ,
    a.DocumentDate,
    a.SupplierInvoice,
    a.CompanyCode,
    a.FiscalYear,
    a.SupplierPostingLineItemText,
    b.PurchaseOrder,
    b.PurchaseOrderItem,
    b.Currency,
    a.SupplierInvoiceIDByInvcgParty,
    a.DocumentHeaderText,
    a.DueCalculationBaseDate,
    a.InvoiceGrossAmount,
    a.DocumentCurrency,
    a.InvoicingParty,
    b.CompanyCodeCurrency,
    b.InvoiceAmtInCoCodeCrcy,
    b.PurchaseOrderAmount,
    b.TaxCode,
    AA.TaxItemGroup,
     a.ReverseDocument,
    AA.PurchasingDocument,
    AA.PurchasingDocumentItem,
    a.InvoiceReference,
    b.DocumentDate
