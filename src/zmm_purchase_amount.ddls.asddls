@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Register'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMM_PURCHASE_AMOUNT as select distinct from I_SupplierInvoiceAPI01 as a
    left outer join I_OperationalAcctgDocItem as b on ( b.OriginalReferenceDocument = a.SupplierInvoiceWthnFiscalYear
                                                             and b.TransactionTypeDetermination = 'WRX'  )
             left outer join I_JournalEntryItem as cc on ( cc.AccountingDocument = b.AccountingDocument and cc.FiscalYear = b.FiscalYear 
                                                       and cc.ReferenceDocumentItem is not initial and cc.Ledger = '0L' )
             
 
{
    key a.SupplierInvoice,
    key a.SupplierInvoiceWthnFiscalYear,
    key a.FiscalYear,
    key b.AccountingDocument,
    key cc.Plant,
        cc.ReferenceDocumentItem,
        cc.ProfitCenter,
        cc.MasterFixedAsset,
        cc.PurchasingDocument,
        cc.PurchasingDocumentItem,
        cast(cc.ReferenceQuantity as abap.dec( 13, 3 )) as ReferenceQuantity,
        cast(cc.Quantity as abap.dec( 13, 3 )) as Quantity,
        cast(cc.AmountInTransactionCurrency as abap.dec( 13, 3 ))as AmountInTransactionCurrency 
        
        
    
    
} 
