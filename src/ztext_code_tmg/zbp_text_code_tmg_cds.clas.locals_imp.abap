CLASS lhc_ZTEXT_CODE_TMG_CDS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ztext_code_tmg_cds RESULT result.

ENDCLASS.

CLASS lhc_ZTEXT_CODE_TMG_CDS IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
