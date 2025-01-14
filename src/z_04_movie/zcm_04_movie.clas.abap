CLASS zcm_04_movie DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    constants:
      begin of invalid_field_value,
        msgid type symsgid value 'Z04_Movie',
        msgno type symsgno value '000',
        attr1 type scx_attrname value 'VALUE',
        attr2 type scx_attrname value 'FIELD',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of invalid_field_value.

      data value type string.
      data field type string.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        severity type if_abap_behv_message=>t_severity
        !previous LIKE previous OPTIONAL
        value type string optional
        field type string optional .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_04_movie IMPLEMENTATION.



  METHOD constructor ##ADT_SUPPRESS_GENERATION.
   super->constructor(  previous = previous ).
   me->value = value.
   me->field = field.
   if_t100_message~t100key = textid.
   if_abap_behv_message~m_severity = severity.
   endmethod.
ENDCLASS.
