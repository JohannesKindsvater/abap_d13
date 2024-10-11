CLASS zcl_16_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA var TYPE /lrn/s4d430_ind_delem.
  DATA x TYPE i VALUE 4.

    SELECT SINGLE
    FROM z16_employ
    FIELDS *
    WHERE first_name = 'John'
    INTO @DATA(output).

    out->write( output ).


    SELECT
    FROM z16_employ
    FIELDS *
    WHERE first_name = 'Janos' OR first_name = 'John'
    INTO @DATA(output2).
        out->write( output2 ).
    ENDSELECT.

  ENDMETHOD.

ENDCLASS.
