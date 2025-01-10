CLASS zcl_04_abap_cds_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_cds_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /DMO/C_Booking_Approver_M
    FIELDS *
    WHERE CarrierID = 'LH' AND connectionID = '0400'
    INTO TABLE @DATA(Flights).


    out->write( flights ).


  ENDMETHOD.
ENDCLASS.
