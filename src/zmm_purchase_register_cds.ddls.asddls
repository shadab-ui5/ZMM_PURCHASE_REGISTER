//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Purchase Register Cds'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
@EndUserText.label: 'Purchase Register Cds'
@Metadata.allowExtensions: true
@ObjectModel: {
    query: {
        implementedBy: 'ABAP:ZMM_PURCHASE_REGISTER_CLASS'
    }
}
define custom entity ZMM_PURCHASE_REGISTER_CDS  
{
     @UI.lineItem             : [{ position: 10 }]
     @EndUserText.label       : 'Miro Doc No.' 
     @UI.selectionField       : [{position: 10 }]  
//     @Consumption.valueHelpDefinition: [ { entity:  { name:    'I_CompanyCode', element: 'CompanyCode' } }]   
 key miro_doc : abap.char( 14 ); 
 
     @UI.lineItem             : [{ position: 20 }]
     @EndUserText.label       : 'Miro Posting Date'
     @UI.selectionField       : [{position: 20 }] 
//     @Consumption.filter.mandatory: true 
     @Consumption.filter.selectionType: #INTERVAL
 key miro_postingdate : abap.dats;
 
     @UI.lineItem             : [{ position: 30 }]
     @EndUserText.label       : 'Journal Entry No.' 
     @UI.selectionField       : [{position: 30 }]     
 key journalentry_no : abap.numc( 10 );
 
     @UI.lineItem             : [{ position: 40 }]
     @EndUserText.label       : 'Miro Line Item'     
 key miro_lineitem : abap.numc( 6 );
 
     @UI.lineItem             : [{ position: 50 }]
     @EndUserText.label       : 'Material TYpe'     
 key ProductType : abap.char( 6 );
 
     @UI.lineItem             : [{ position: 60 }]
     @EndUserText.label       : 'Material'     
 key material : abap.char( 18 );
 
     @UI.lineItem             : [{ position: 70 }]
     @EndUserText.label       : 'Material Description'     
 key ProductDescription : abap.char( 200 );
 
     @UI.lineItem             : [{ position: 80 }]
     @EndUserText.label       : 'HSN Code'     
 key HSN : abap.char( 10 );
 
     @UI.lineItem             : [{ position: 90 }]
     @EndUserText.label       : 'HSN Code Desc.'     
 key HSNCode_Desc : abap.char( 200 );
 
     @UI.lineItem             : [{ position: 100 }]
     @EndUserText.label       : 'Plant'     
     @UI.selectionField       : [{position: 40 }]
     Plant : abap.char( 4 );
   
     @UI.lineItem             : [{ position: 110 }]
     @EndUserText.label       : 'Purchasing Document'     
     PurchasingDocument : abap.numc( 10 );
         
     @UI.lineItem             : [{ position: 120 }]
     @EndUserText.label       : 'Purchasing Document Item'     
     PurchasingDocumentItem : abap.numc( 6 );
         
     @UI.lineItem             : [{ position: 130 }]
     @EndUserText.label       : 'Material Profit Center'     
     ProfitCenter : abap.char( 10 );
         
     @UI.lineItem             : [{ position: 140 }]
     @EndUserText.label       : 'Fix Asset Code'     
     MasterFixedAsset : abap.char( 10 );
 
     @UI.lineItem             : [{ position: 150 }]
     @EndUserText.label       : 'Journal Entry Type' 
//     @UI.lineItem: [{ position: 150, label: 'Document Type', criticality: 'DocumentCriticality' }]    
  AccountingDocumentType : abap.char( 3 );
 
     @UI.lineItem             : [{ position: 160 }]
     @EndUserText.label       : 'Miro Document Type'     
  DocumentDate : abap.dats;
 
     @UI.lineItem             : [{ position: 170 }]
     @EndUserText.label       : 'Miro Reference No.'     
  DocumentReferenceID : abap.char( 25 );
 
////     @UI.lineItem             : [{ position: 180 }]
////     @EndUserText.label       : 'Migo Doc No.'     
////     migo_Docno,
// 
////     @UI.lineItem             : [{ position: 190 }]
////     @EndUserText.label       : 'Migo Posting Date'     
////     '' as migopostingdate,
 
     @UI.lineItem             : [{ position: 200 }]
     @EndUserText.label       : 'Vendor Code' 
     @UI.selectionField       : [{position: 40 }]      
  VendorCode : abap.numc( 10 );

  @UI.lineItem             : [{ position: 210 }]
  @EndUserText.label       : 'Vendor Name'     
  SupplierFullName : abap.char( 50 );

  @UI.lineItem             : [{ position: 220 }]
  @EndUserText.label       : 'Vendor Pan No.'     
  PanNumber : abap.char( 12 );

  @UI.lineItem             : [{ position: 230 }]
  @EndUserText.label       : 'Vendor MSME No.'     
  VendorMSME : abap.char( 20 );

  @UI.lineItem             : [{ position: 240 }]
  @EndUserText.label       : 'Vendor GST No.'     
  Vendor_GSTIN : abap.char( 20 );

  @UI.lineItem             : [{ position: 250 }]
  @EndUserText.label       : ' Vendor State Code'     
  StateCode : abap.char( 10 );

  @UI.lineItem             : [{ position: 260 }]
  @EndUserText.label       : 'Vendor State Code Desc.'     
  Region_Desc : abap.char( 50 );

  @UI.lineItem             : [{ position: 270 }]
  @EndUserText.label       : 'Migo/Miro GL No.'     
  migo_GL : abap.numc( 10 );

  @UI.lineItem             : [{ position: 280 }]
  @EndUserText.label       : 'Migo/Miro GL Description'     
  migo_GLName : abap.char( 60 );

  @UI.lineItem             : [{ position: 290 }]
  @EndUserText.label       : 'Miro Line Item TaxCode'     
  Miro_item_taxCode : abap.char( 2 );

  @UI.lineItem             : [{ position: 300 }]
  @EndUserText.label       : 'Miro Item Text Code Desc.'     
  TaxCodeName : abap.char( 100 );
 
     @UI.lineItem             : [{ position: 310 }]
     @EndUserText.label       : 'Miro Qty'
//     @Aggregation.default:  #SUM     
     miro_Qty : abap.dec( 13, 3 );
  
//     @UI.lineItem             : [{ position: 320 }]
//     @EndUserText.label       : ' Miro UOM'     
//     '' as MiroUOM : abap.u
         
     @UI.lineItem             : [{ position: 330 }]
     @EndUserText.label       : 'Po Item Rate'   
  POItem_rate : abap.dec( 13, 3 );
      

  @UI.lineItem             : [{ position: 340 }]
  @EndUserText.label       : 'Miro Basic Amount'
  @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
  BasicAmount : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 350 }]
  @EndUserText.label       : 'CGST GL Amount'   
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
  CGST : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 360 }]
  @EndUserText.label       : 'CGST Tax Rate %'  
  CGST_rate: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 370 }]
  @EndUserText.label       : 'SGST GL Amount' 
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }    
  SGST : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 380 }]
  @EndUserText.label       : 'SGST Tax Rate %'    
  SGST_rate : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 390 }]
  @EndUserText.label       : 'IGST GL AMount' 
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }   
  IGST : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 400 }]
  @EndUserText.label       : 'IGST Tax RAte %'     
  IGST_rate : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 410 }]
  @EndUserText.label       : 'TCS Rate'     
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
  TCS_AMT: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 420 }]
  @EndUserText.label       : 'CGST GL Amount'     
  TCS_rate: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 430 }]
  @EndUserText.label       : 'Revised Basic Excluding GST Amt'
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }    
  Revised_BasicCGST: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 440 }]
  @EndUserText.label       : 'Non Credit CGST'     
  NON_credit_CGST: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 450 }]
  @EndUserText.label       : 'Non Credit CGST %'     
  non_credit_cgst_per: abap.dec( 13, 3 );


  @UI.lineItem             : [{ position: 460 }]
  @EndUserText.label       : 'Non Credit SGST'     
  Non_credit_SGST: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 470 }]
  @EndUserText.label       : 'Non Credit SGST %'     
  non_credit_sgst_per: abap.dec( 13, 3 );


  @UI.lineItem             : [{ position: 480 }]
  @EndUserText.label       : 'Non Credit IGST'     
  @Aggregation.default:  #SUM
  Non_credit_IGST: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 490 }]
  @EndUserText.label       : 'Non Credit IGST %'   
  non_credit_igst_per: abap.dec( 13, 3 );


  @UI.lineItem             : [{ position: 500 }]
  @EndUserText.label       : 'Total Bill AMount'
  TOT_Bill_AMT: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 510 }]
  @EndUserText.label       : 'TDS Value'  
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }   
  TDS_VALUE: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 520 }]
  @EndUserText.label       : 'Bill Amount After TDS'     
  BillAmt_afterTDS: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 530 }]
  @EndUserText.label       : 'TDS GL'     
  GLAccount: abap.numc( 10 );

  @UI.lineItem             : [{ position: 540 }]
  @EndUserText.label       : 'TDS GL Description'     
  GLAccountLongName : abap.char( 200 );
 
//     @UI.lineItem             : [{ position: 550 }]
//     @EndUserText.label       : 'Net Wt'     
//     '' as NetWT,
//
//     @UI.lineItem             : [{ position: 560 }]
//     @EndUserText.label       : 'Total Net Wt'     
//     '' as NetWT_Tot, 

     @UI.lineItem             : [{ position: 570 }]
     @EndUserText.label       : 'Net Wt UOM'     
  UOM : abap.unit( 3 );
 
  @UI.lineItem             : [{ position: 580 }]
  @EndUserText.label       : 'Gross Weight'  
  @Semantics.quantity.unitOfMeasure: 'WeightUnit'   
  GrossWeight: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 590 }]
  @EndUserText.label       : 'Supplier City'     
  CityName : abap.char( 20 );

  @UI.lineItem             : [{ position: 600 }]
  @EndUserText.label       : 'Freight Amount'   
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }  
  freight_amt : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 610 }]
  @EndUserText.label       : 'Miro Header Text'     
  miro_hdrText : abap.char( 40 );

  @UI.lineItem             : [{ position: 620 }]
  @EndUserText.label       : 'Miro Item Text'     
  miro_itemText : abap.char( 40 );

  @UI.lineItem             : [{ position: 630 }]
  @EndUserText.label       : 'Business Place'     
  BusinessPlace : abap.char( 10 );

  @UI.lineItem             : [{ position: 640 }]
  @EndUserText.label       : 'RCM Flag'     
  RCM_flag : abap.char( 2 );

  @UI.lineItem             : [{ position: 650 }]
  @EndUserText.label       : 'Eligibility Indicator'     
  Eligibility_ind : abap.char( 2 );

  @UI.lineItem             : [{ position: 660 }]
  @EndUserText.label       : 'Common Supply Indicator'     
  Common_supply_ind : abap.char( 2 );

  @UI.lineItem             : [{ position: 670 }]
  @EndUserText.label       : 'Available CGST'   
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
  available_CGST : abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 680 }]
  @EndUserText.label       : 'Available SGST' 
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }    
  available_SGST: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 690 }]
  @EndUserText.label       : 'Available IGST'    
  @Semantics: { amount : {currencyCode: 'TransactionCurrency'} } 
  available_IGST: abap.dec( 13, 3 );

  @UI.lineItem             : [{ position: 700 }]
  @EndUserText.label       : 'Document Type'     
  DocumentType: abap.char( 3 );

  @UI.lineItem             : [{ position: 710 }]
  @EndUserText.label       : 'Type'     
  Type : abap.char( 10 );

  @UI.lineItem             : [{ position: 720 }]
  @EndUserText.label       : 'Original Document'     
  originalDocument:abap.char( 12 );

  @UI.lineItem             : [{ position: 730 }]
  @EndUserText.label       : 'Payment Date'     
  paymentduedate :abap.dats;

 
  @UI.lineItem             : [{ position: 740 }]
  @EndUserText.label       : 'Vendor Status'     
  VendorStatus : abap.char( 20 );
 
  CompanyCodeCurrency : abap.cuky( 5 );
  TransactionCurrency : abap.cuky( 5 );
  WeightUnit : abap.unit( 3 );
     
}

