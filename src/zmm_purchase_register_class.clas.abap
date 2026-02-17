CLASS zmm_purchase_register_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:BEGIN OF ty_final,

            miro_doc               TYPE i_supplierinvoiceapi01-supplierinvoice,
            miro_postingdate       TYPE i_supplierinvoiceapi01-postingdate,
            journalentry_no        TYPE i_operationalacctgdocitem-accountingdocument,
            miro_lineitem          TYPE i_journalentryitem-referencedocumentitem,
            producttype            TYPE i_product-producttype,
            material               TYPE i_journalentryitem-product,
            productdescription     TYPE i_productdescription_2-productdescription,
            hsn                    TYPE i_purchaseorderitemapi01-br_ncm,
            hsncode_desc           TYPE i_purchaseorderitemapi01-purchaseorderitemtext,
            plant                  TYPE i_journalentryitem-plant,
            purchasingdocument     TYPE i_journalentryitem-purchasingdocument,
            purchasingdocumentitem TYPE i_journalentryitem-purchasingdocumentitem,
            profitcenter           TYPE i_journalentryitem-profitcenter,
            masterfixedasset       TYPE i_journalentryitem-masterfixedasset,
            accountingdocumenttype TYPE i_journalentry-accountingdocumenttype,
            documentdate           TYPE i_journalentry-documentdate,
            documentreferenceid    TYPE i_journalentry-documentreferenceid,
            migo_docno             TYPE i_operationalacctgdocitem-reference3idbybusinesspartner,
            migopostingdate        TYPE i_operationalacctgdocitem-postingdate,
            vendorcode             TYPE i_supplierinvoiceapi01-invoicingparty,
            supplierfullname       TYPE i_supplier-supplierfullname,
            pannumber              TYPE i_supplier-businesspartnerpannumber,
            vendormsme             TYPE i_bupaidentification-bpidentificationnumber,
            vendor_gstin           TYPE i_supplier-taxnumber3,
            statecode              TYPE i_bupaidentification-region,
            region_desc            TYPE char72 ,
            migo_gl                TYPE i_journalentryitem-glaccount,
            migo_glname            TYPE i_glaccounttext-glaccountlongname,
            miro_item_taxcode      TYPE i_supplierinvoicetaxapi01-taxcode,
            taxcodename            TYPE i_taxcodetext-taxcodename,
            miro_qty               TYPE p LENGTH 13 DECIMALS 2,   "i_journalentryitem-referencequantity,
            POItem_rate            TYPE p LENGTH 13 DECIMALS 2,
            mirouom                TYPE i_product-baseunit,
            basicamount            TYPE i_supplierinvoicetaxapi01-taxbaseamountincocodecrcy,
            cgst                   TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            cgst_rate              TYPE ztext_code_tmg_cds-percentage,
            sgst                   TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            sgst_rate              TYPE ztext_code_tmg_cds-percentage,
            igst                   TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            igst_rate              TYPE ztext_code_tmg_cds-percentage,
            tcs_amt                TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            tcs_rate               TYPE ztext_code_tmg_cds-percentage,
            revised_basiccgst      TYPE i_operationalacctgdocitem-taxbaseamountincocodecrcy,
            non_credit_cgst        TYPE i_supplierinvoicetaxapi01-taxamount,
            non_credit_cgst_per    TYPE ztext_code_tmg_cds-percentage,
            non_credit_sgst        TYPE i_supplierinvoicetaxapi01-taxamount,
            non_credit_sgst_per    TYPE ztext_code_tmg_cds-percentage,
            non_credit_igst        TYPE i_supplierinvoicetaxapi01-taxamount,
            non_credit_igst_per    TYPE ztext_code_tmg_cds-percentage,
            tot_bill_amt           TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            tds_value              TYPE i_operationalacctgdocitem-withholdingtaxamount,
            billamt_aftertds       TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            glaccount              TYPE i_operationalacctgdocitem-glaccount,
            glaccountlongname      TYPE i_glaccounttext-glaccountlongname,
            netwt                  TYPE i_product-grossweight,
            netwt_tot              TYPE i_product-grossweight,
            netwt_uom              TYPE i_product-baseunit,
            grossweight            TYPE i_product-grossweight,
            cityname               TYPE i_supplier-cityname,
            freight_amt            TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            miro_hdrtext           TYPE i_journalentryitem-documentitemtext,
            miro_itemtext          TYPE i_journalentryitem-documentitemtext,
            businessplace          TYPE i_operationalacctgdocitem-businessplace,
            rcm_flag               TYPE c LENGTH 1,
            eligibility_ind        TYPE i_product-producttype,
            common_supply_ind      TYPE i,
            available_cgst         TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            available_sgst         TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            available_igst         TYPE i_operationalacctgdocitem-amountintransactioncurrency,
            documenttype           TYPE i_journalentry-accountingdocumenttype,
            type                   TYPE i_journalentry-transactioncode,
            originaldocument       TYPE i_supplierinvoiceapi01-reversedocument,
            PaymentDueDate         TYPE i_operationalacctgdocitem-NetDueDate,
            vendorstatus           TYPE i_supplier-in_gstsupplierclassification,
            UOM                    TYPE i_product-BaseUnit,
            WeightUnit             TYPE i_product-BaseUnit,
            DocumentCurrency       TYPE i_supplierinvoicetaxapi01-DocumentCurrency,
            CompanyCodeCurrency       TYPE I_OperationalAcctgDocItem-CompanyCodeCurrency,

          END OF ty_final.

    DATA:it_final TYPE TABLE OF ty_final,
         wa_final TYPE ty_final.

    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZMM_PURCHASE_REGISTER_CLASS IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA: lt_response TYPE TABLE OF ZMM_PURCHASE_REGISTER_CDS.
    DATA:lt_current_output TYPE TABLE OF ZMM_PURCHASE_REGISTER_CDS.
    DATA:wa1 TYPE ZMM_PURCHASE_REGISTER_CDS.

    DATA(lt_clause)        = io_request->get_filter( )->get_as_sql_string( ).
    DATA(lv_top)           = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)          = io_request->get_paging( )->get_offset( ).
    DATA(lt_fields)        = io_request->get_requested_elements( ).
    DATA(lt_sort)          = io_request->get_sort_elements( ).
    DATA(lt_filter)        = io_request->get_filter( )->get_as_sql_string( ).
    DATA(get_aggregation)  = io_request->get_aggregation( )."get_filter( )->get_as_sql_string( ).
    DATA(lt_agg)           = io_request->get_aggregation( ).
    DATA(lt_agg1)          = io_request->get_aggregation( )->get_aggregated_elements( ).

    TRY.
        DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range INTO DATA(lx_no_sel_option).
    ENDTRY.

    DATA(SupplierInvoice)             =  VALUE #( lt_filter_cond[ name   =  'MIRO_DOC'  ]-range OPTIONAL ).
    DATA(miro_Postingdate)             =  VALUE #( lt_filter_cond[ name   =  'MIRO_POSTINGDATE'  ]-range OPTIONAL ).
    DATA(JOURNALENTRY_NO)           =  VALUE #( lt_filter_cond[ name   =  'JOURNALENTRY_NO'  ]-range OPTIONAL ).
    DATA(PLANT)  =  VALUE #( lt_filter_cond[ name   =  'PLANT'  ]-range OPTIONAL ).
    DATA(VENDORCODE)  =  VALUE #( lt_filter_cond[ name   =  'VENDORCODE'  ]-range OPTIONAL ).


    SELECT DISTINCT
       miro_doc,
     miro_postingdate,
     journalentry_no,
     journalentry_item,
     materialType,
     material,
     material_desc,
     HSNCode,
     HSNCode_Desc,
     Plant,
     PurchasingDocument,
     PurchasingDocumentItem,
     ProfitCenter,
     MasterFixedAsset,
     AccountingDocumentType,
     miro_docdate,
     miro_Refno,
     migo_Docno,
     VendorCode,
     VendorName,
     PanNumber,
     VendorMSME,
     Vendor_GSTIN,
     StateCode,
     StateCode_Desc,
     miro_gl,
     miro_glname,
     Miro_item_taxCode,
     miro_Qty,
     BaseUnit,
     POItem_rate,
     DocumentCurrency,
     BasicAmount,
     CompanyCodeCurrency,
     CGST,
     CGST_rate,
     SGST,
     SGST_rate,
     IGST,
     IGST_rate,
     Total_Amount,
     TDS_VALUE,
     BillAmt_afterTDS,
     TransactionCurrency,
     CityName,
     miro_BusinessPlace,
     RCM_flag,
     Eligibility_ind,
     Common_supply_ind,
     DocumentType,
     originalDocument,
     PaymentDueDate,
     VendorStatus,
     Type

       FROM ZMM_PURCHASE_REGISTER as a

        WHERE a~migo_Docno IN @supplierinvoice
          AND a~miro_postingdate IN @miro_Postingdate
          AND a~journalentry_no IN @journalentry_no
          AND a~plant IN @PLANT
          AND a~VendorCode IN @vendorcode

           INTO TABLE @DATA(i_data) .

*    SORT i_data BY miro_doc .
*    DELETE ADJACENT DUPLICATES FROM i_data COMPARING miro_doc miro_lineitem .
    LOOP AT i_data INTO DATA(w_data) .

      wa_final-miro_doc                        = w_data-miro_doc.
      wa_final-miro_postingdate                = w_data-miro_postingdate.
      wa_final-journalentry_no                 = w_data-journalentry_no.
      wa_final-miro_lineitem                   = w_data-journalentry_item.
      wa_final-ProductType                     = w_data-materialType.
      wa_final-material                        = w_data-material.
      wa_final-ProductDescription              = w_data-material_desc.
      wa_final-HSN                             = w_data-HSNCode.
      wa_final-HSNCode_Desc                    = w_data-HSNCode_Desc.
      wa_final-Plant                           = w_data-Plant.
      wa_final-PurchasingDocument              = w_data-PurchasingDocument.
      wa_final-PurchasingDocumentItem          = w_data-PurchasingDocumentItem .
      wa_final-ProfitCenter                    = w_data-ProfitCenter .
      wa_final-MasterFixedAsset                = w_data-MasterFixedAsset.
      wa_final-AccountingDocumentType          = w_data-AccountingDocumentType.
      wa_final-DocumentDate                    = w_data-miro_docdate.
      wa_final-DocumentReferenceID             = w_data-miro_Refno.
      wa_final-migo_docno                      = w_data-migo_Docno.
      wa_final-VendorCode                      = w_data-VendorCode.
      wa_final-SupplierFullName                = w_data-VendorName.
      wa_final-PanNumber                       = w_data-PanNumber.
      wa_final-vendormsme                      = w_data-VendorMSME.
      wa_final-Vendor_GSTIN                    = w_data-Vendor_GSTIN.
      wa_final-StateCode                       = w_data-StateCode.
      wa_final-region_desc                     = w_data-StateCode_Desc.
      wa_final-migo_GL                         = w_data-miro_gl.
      wa_final-migo_GLName                     = w_data-miro_glname.
      wa_final-documentcurrency                = w_data-DocumentCurrency.
      wa_final-Miro_item_taxCode               = w_data-Miro_item_taxCode.
*      wa_final-TaxCodeName                     = w_data-TaxCodeName.
      wa_final-miro_Qty                        = w_data-miro_Qty.
      wa_final-POItem_rate                     = w_data-POItem_rate .
      wa_final-cgst                            = w_data-cgst.
      wa_final-cgst_rate                       = w_data-CGST_rate.
      wa_final-sgst                            = w_data-sgst.
      wa_final-sgst_rate                       = w_data-SGST_rate.
      wa_final-igst                            = w_data-igst.
      wa_final-igst_rate                       = w_data-IGST_rate.
      wa_final-tot_bill_amt                    = w_data-Total_Amount.
      wa_final-tds_value                       = w_data-tds_value.
      wa_final-billamt_aftertds                = w_data-BillAmt_afterTDS.
      wa_final-cityname                        = w_data-CityName.
      wa_final-businessplace                   = w_data-miro_BusinessPlace.
      wa_final-rcm_flag                        = w_data-RCM_flag.
      wa_final-eligibility_ind                 = w_data-Eligibility_ind.
      wa_final-common_supply_ind               = w_data-Common_supply_ind.
      wa_final-documenttype                    = w_data-DocumentType.
      wa_final-originaldocument                = w_data-originalDocument.
      wa_final-paymentduedate                  = w_data-PaymentDueDate.
      wa_final-vendorstatus                    = w_data-VendorStatus.
      wa_final-type                            = w_data-Type.










      APPEND wa_final TO it_final.
      CLEAR:wa_final.
    ENDLOOP.

    MOVE-CORRESPONDING it_final TO lt_response.

    TRY.

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
        DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
        DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                    THEN 0
                                    ELSE lv_page_size ).
        " sorting
        DATA(sort_elements) = io_request->get_sort_elements( ).
        DATA(lt_sort_criteria) = VALUE string_table(
            FOR sort_element IN sort_elements
            ( sort_element-element_name && COND #( WHEN sort_element-descending = abap_true
                                                   THEN ` descending`
                                                   ELSE ` ascending` ) ) ).

        DATA lv_sort_string TYPE string .
        lv_sort_string  = COND #( WHEN lt_sort_criteria IS INITIAL THEN '                                   '
                                                                            ELSE concat_lines_of( table = lt_sort_criteria sep = `, ` ) ).
        " requested elements
        DATA(lt_req_elements) = io_request->get_requested_elements( ).
        " aggregate
        DATA(lt_aggr_element) = io_request->get_aggregation( )->get_aggregated_elements( ).

        IF lt_aggr_element IS NOT INITIAL.
          LOOP AT lt_aggr_element ASSIGNING FIELD-SYMBOL(<fs_aggr_element>).
            DELETE lt_req_elements WHERE table_line = <fs_aggr_element>-result_element.
            DATA(lv_aggregation) = |{ <fs_aggr_element>-aggregation_method }( { <fs_aggr_element>-input_element } ) as { <fs_aggr_element>-result_element }|.
            APPEND lv_aggregation TO lt_req_elements.
          ENDLOOP.
        ENDIF.
        DATA(lv_req_elements) = concat_lines_of( table = lt_req_elements
                                                 sep   = `, ` ).
        " grouping
*        DATA(lt_grouped_element) = io_request->get_aggregation( )->get_grouped_elements( ).
*        DATA(lv_grouping) = concat_lines_of( table = lt_grouped_element
*                                             sep   = `, ` ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grouping
DATA(lt_grouped_element) = io_request->get_aggregation( )->get_grouped_elements( ).
DATA(lv_grouping) = concat_lines_of( table = lt_grouped_element
                                     sep   = `, ` ).

"=== FIX START ===
" Ensure MIRO_DOC is always in GROUP BY when aggregation used
IF lt_aggr_element IS NOT INITIAL.
  IF lv_grouping IS NOT INITIAL.
    IF NOT ( lv_grouping CS 'MIRO_DOC' ).
      lv_grouping = lv_grouping && ', MIRO_DOC'.
    ENDIF.
  ELSE.
    lv_grouping = 'MIRO_DOC'.
  ENDIF.
ENDIF.
"=== FIX END ===


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""




        IF lv_sort_string IS INITIAL.
          IF lv_grouping IS NOT INITIAL .
            lv_sort_string = lv_grouping .
          ELSE .
            lv_sort_string  = 'MIRO_DOC' .
          ENDIF .
        ENDIF .

        SELECT (lv_req_elements) FROM @lt_response AS a
                                            WHERE (lt_clause)
                                            GROUP BY (lv_grouping)
                                            ORDER BY (lv_sort_string)
                                            INTO CORRESPONDING FIELDS OF TABLE @lt_current_output
                                            OFFSET @lv_offset
                                             UP TO @lv_max_rows ROWS.

        IF io_request->is_total_numb_of_rec_requested(  ).
          io_response->set_total_number_of_records( lines( lt_response ) ).
        ENDIF.
        IF io_request->is_data_requested(  ).
          io_response->set_data( lt_current_output ).
        ENDIF.

      CATCH cx_root INTO DATA(lv_exception).
        DATA(lv_exception_message) = cl_message_helper=>get_latest_t100_exception( lv_exception )->if_message~get_longtext( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
