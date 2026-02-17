@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZMM_PURCHASE_REGISTER_CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZMM_PURCHASE_REGISTER_FINAL as select distinct from ZMM_PURCHASE_REGISTER_CDS2
{

     @UI.lineItem             : [{ position: 10 }]
     @EndUserText.label       : 'Miro Doc No.' 
     @UI.selectionField       : [{position: 10 }]  
//     @Consumption.valueHelpDefinition: [ { entity:  { name:    'I_CompanyCode', element: 'CompanyCode' } }]   
 key miro_doc,
 
     @UI.lineItem             : [{ position: 20 }]
     @EndUserText.label       : 'Miro Posting Date'
     @UI.selectionField       : [{position: 20 }]   
     @Consumption.filter.selectionType: #INTERVAL
//     @Consumption.filter.mandatory: true  
 key miro_postingdate,
 
     @UI.lineItem             : [{ position: 30 }]
     @EndUserText.label       : 'Journal Entry No.' 
     @UI.selectionField       : [{position: 30 }]     
 key journalentry_no,
 
     @UI.lineItem             : [{ position: 40 }]
     @EndUserText.label       : 'Miro Line Item'     
 key journalentry_item,
 
     @UI.lineItem             : [{ position: 50 }]
     @EndUserText.label       : 'Material TYpe'     
     materialType,
 
     @UI.lineItem             : [{ position: 60 }]
     @EndUserText.label       : 'Material'     
     material,
 
     @UI.lineItem             : [{ position: 70 }]
     @EndUserText.label       : 'Material Description'     
     material_desc,
 
     @UI.lineItem             : [{ position: 80 }]
     @EndUserText.label       : 'HSN Code'     
     HSNCode,
 
     @UI.lineItem             : [{ position: 90 }]
     @EndUserText.label       : 'HSN Code Desc.'     
     HSNCode_Desc,
 
     @UI.lineItem             : [{ position: 100 }]
     @EndUserText.label       : 'Plant'     
     @UI.selectionField       : [{position: 40 }]
     Plant,
   
     @UI.lineItem             : [{ position: 110 }]
     @EndUserText.label       : 'Purchasing Document'     
     PurchasingDocument,
         
     @UI.lineItem             : [{ position: 120 }]
     @EndUserText.label       : 'Purchasing Document Item'     
     PurchasingDocumentItem,
         
     @UI.lineItem             : [{ position: 130 }]
     @EndUserText.label       : 'Material Profit Center'     
     ProfitCenter,
         
     @UI.lineItem             : [{ position: 140 }]
     @EndUserText.label       : 'Fix Asset Code'     
     MasterFixedAsset,
 
     @UI.lineItem             : [{ position: 150 }]
     @EndUserText.label       : 'Journal Entry Type' 
     AccountingDocumentType,
 
     @UI.lineItem             : [{ position: 160 }]
     @EndUserText.label       : 'Miro Document Date'     
     miro_docdate,
 
     @UI.lineItem             : [{ position: 170 }]
     @EndUserText.label       : 'Miro Reference No.'     
     miro_Refno,
 
     @UI.lineItem             : [{ position: 180 }]
     @EndUserText.label       : 'Migo Doc No.'     
     migo_Docno,
 
     @UI.lineItem             : [{ position: 190 }]
     @EndUserText.label       : 'Migo Posting Date'     
     migo_Docno_date,
 
     @UI.lineItem             : [{ position: 200 }]
     @EndUserText.label       : 'Vendor Code' 
     @UI.selectionField       : [{position: 50 }]      
     VendorCode,
 
     @UI.lineItem             : [{ position: 210 }]
     @EndUserText.label       : 'Vendor Name'     
     VendorName,
 
     @UI.lineItem             : [{ position: 220 }]
     @EndUserText.label       : 'Vendor Pan No.'     
     PanNumber,
 
     @UI.lineItem             : [{ position: 230 }]
     @EndUserText.label       : 'Vendor MSME No.'     
     VendorMSME,

     @UI.lineItem             : [{ position: 240 }]
     @EndUserText.label       : 'Vendor GST No.'     
     Vendor_GSTIN,

     @UI.lineItem             : [{ position: 250 }]
     @EndUserText.label       : ' Vendor State Code'     
     StateCode,
    
     @UI.lineItem             : [{ position: 260 }]
     @EndUserText.label       : 'Vendor State Code Desc.'     
     StateCode_Desc,
    
     @UI.lineItem             : [{ position: 270 }]
     @EndUserText.label       : 'Migo/Miro GL No.'     
     miro_gl,
    
     @UI.lineItem             : [{ position: 280 }]
     @EndUserText.label       : 'Migo/Miro GL Description'     
     miro_glname,
    
     @UI.lineItem             : [{ position: 290 }]
     @EndUserText.label       : 'Tax Code'     
     Miro_item_taxCode,
    
     @UI.lineItem             : [{ position: 300 }]
     @EndUserText.label       : 'Miro Item Text Code Desc.'     
     Miro_item_taxCode_dec,

     @UI.lineItem             : [{ position: 310 }]
     @EndUserText.label       : 'Miro Quantity'
     @Semantics: { quantity : {unitOfMeasure: 'BaseUnit'} }
     miro_Qty,
     
     @UI.lineItem             : [{ position: 315 }]
     @EndUserText.label       : 'Miro UOM'
     BaseUnit,
 
     @UI.lineItem             : [{ position: 320 }]
     @EndUserText.label       : 'PO Item Rate'
     @Semantics.amount.currencyCode: 'DocumentCurrency'
     POItem_rate, 
 
     @UI.lineItem             : [{ position: 330 }]
     @EndUserText.label       : 'Miro Basic Amount'
     @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
     BasicAmount,
 
     @UI.lineItem             : [{ position: 340 }]
     @EndUserText.label       : 'CGST GL Amount'   
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     CGST,

     @UI.lineItem             : [{ position: 350 }]
     @EndUserText.label       : 'CGST Tax Rate %'  
     CGST_rate,
 
     @UI.lineItem             : [{ position: 360 }]
     @EndUserText.label       : 'SGST GL Amount' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }    
     SGST,
 
     @UI.lineItem             : [{ position: 370 }]
     @EndUserText.label       : 'SGST Tax Rate %'    
     SGST_rate,
 
     @UI.lineItem             : [{ position: 380 }]
     @EndUserText.label       : 'IGST GL AMount' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }   
     IGST,
 
     @UI.lineItem             : [{ position: 390 }]
     @EndUserText.label       : 'IGST Tax RAte %'     
     IGST_rate,
 
     @UI.lineItem             : [{ position: 400 }]
     @EndUserText.label       : 'TCS Amount'     
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     TDS_VALUE,
 
//     @UI.lineItem             : [{ position: 410 }]
//     @EndUserText.label       : 'TCS Rate'     
// key TCS_rate,
 
     @UI.lineItem             : [{ position: 420 }]
     @EndUserText.label       : 'Revised Basic Excluding GST Amt'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }    
     Revised_bas_exclud_GstAmt,
 
     @UI.lineItem             : [{ position: 430 }]
     @EndUserText.label       : 'Non Credit CGST'     
     Non_cr_cgst,

     @UI.lineItem             : [{ position: 440 }]
     @EndUserText.label       : 'Non Credit CGST %'     
     Miro_item_taxCode_dec as non_credit_cgst_per ,

 
     @UI.lineItem             : [{ position: 450 }]
     @EndUserText.label       : 'Non Credit SGST'     
     Non_cr_sgst,
 
     @UI.lineItem             : [{ position: 460 }]
     @EndUserText.label       : 'Non Credit SGST %'     
     Miro_item_taxCode_dec as non_credit_sgst_per,
 
 
     @UI.lineItem             : [{ position: 470 }]
     @EndUserText.label       : 'Non Credit IGST'     
     @Aggregation.default:  #SUM
     Non_cr_igst,
 
     @UI.lineItem             : [{ position: 480 }]
     @EndUserText.label       : 'Non Credit IGST %'   
     Miro_item_taxCode_dec as non_credit_igst_per,
 
     @UI.lineItem             : [{ position: 490 }]
     @EndUserText.label       : 'Total Bill AMount'
     Total_Amount,

     @UI.lineItem             : [{ position: 500 }]
     @EndUserText.label       : 'TDS Value'  
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }   
     tcs_amount,
   
     @UI.lineItem             : [{ position: 510 }]
     @EndUserText.label       : 'Bill Amount After TDS'     
     BillAmt_afterTDS,
     
     @UI.lineItem             : [{ position: 515 }]
     @EndUserText.label       : 'TDS/TCS GL'     
     tds_gl,
     
     @UI.lineItem             : [{ position: 520 }]
     @EndUserText.label       : 'TDS/TCS GL Description'     
     tds_gl_desc,
     
     @UI.lineItem             : [{ position: 525 }]
     @EndUserText.label       : 'Net Weight'
     @Semantics.quantity.unitOfMeasure: 'WeightUnit'
     NetWeight,
     
     @UI.lineItem             : [{ position: 530 }]
     @EndUserText.label       : 'Net Weight Total Qty' 
     Netweight_tot_Qty,
     
     @UI.lineItem             : [{ position: 535 }]
     @EndUserText.label       : 'Net Weight UOM'     
     net_weight_unit,
     
     @UI.lineItem             : [{ position: 540 }]
     @EndUserText.label       : 'Gross Weight'     
     GrossWeight,
     
     @UI.lineItem             : [{ position: 545 }]
     @EndUserText.label       : 'City Name'     
     CityName,
     
     @UI.lineItem             : [{ position: 550 }]
     @EndUserText.label       : 'Freight Amount'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }     
     freight_amount,
     
     @UI.lineItem             : [{ position: 555 }]
     @EndUserText.label       : 'Miro Header Text'
     miro_header_text,
     
     @UI.lineItem             : [{ position: 560 }]
     @EndUserText.label       : 'Miro Line Item Wise Text'
     miro_lineItem_text,
     
     @UI.lineItem             : [{ position: 565 }]
     @EndUserText.label       : 'Miro Business Places'     
     miro_BusinessPlace,
    
     @UI.lineItem             : [{ position: 570 }]   
     @EndUserText.label       : 'RCM Flag'        
     RCM_flag,
     
     @UI.lineItem             : [{ position: 575 }]   
     @EndUserText.label       : 'Eligibility Indicator'        
     Eligibility_ind,   
   
     @UI.lineItem             : [{ position: 580 }]   
     @EndUserText.label       : 'Common Supply Indicator'        
     Common_supply_ind,
     
     @UI.lineItem             : [{ position: 585 }]   
     @EndUserText.label       : 'Available CGST' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     CGST as cgst1,
     
     @UI.lineItem             : [{ position: 590 }]   
     @EndUserText.label       : 'Available SGST' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     SGST as Sgst1,
     
     @UI.lineItem             : [{ position: 595 }]   
     @EndUserText.label       : 'Available IGST' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     IGST as igst1,
     
     @UI.lineItem             : [{ position: 600 }]    
     @EndUserText.label       : 'Document Type'        
     DocumentType,   
   
     @UI.lineItem             : [{ position: 605 }]   
     @EndUserText.label       : 'Type'        
     Type,   
   
     @UI.lineItem             : [{ position: 610 }]   
     @EndUserText.label       : 'Original Document'        
     originalDocument,  
     
     @UI.lineItem             : [{ position: 615 }]   
     @EndUserText.label       : 'Payment Due Date'
     PaymentDueDate, 
    
     @UI.lineItem             : [{ position: 620 }]   
     @EndUserText.label       : 'Vendor Status'        
     VendorStatus,
     
     @UI.lineItem             : [{ position: 625 }]   
     @EndUserText.label       : 'Inventory GL'        
     MIGO_GL1,
     
     @UI.lineItem             : [{ position: 630 }]   
     @EndUserText.label       : 'Inv GL Disc'        
     MIGO_GL_D,
     
     WeightUnit,
     DocumentCurrency,
     CompanyCodeCurrency,   
     TransactionCurrency   
       
        
 
 
} 

