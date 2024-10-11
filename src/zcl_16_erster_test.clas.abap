CLASS zcl_16_erster_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA zahl1 TYPE i VALUE 4.
    DATA zahl2 TYPE i VALUE 2.
    DATA op TYPE c VALUE '-'.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_erster_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DATA blabla TYPE c.
*  blabla = 'c'.
*
*      CASE op.
*        WHEN '+'.
*            out->write( zahl1 + zahl2 ).
*        WHEN '-'.
*            out->write( zahl1 - zahl2 ).
*        WHEN '*'.
*            out->write( zahl1 * zahl2 ).
*        WHEN '/'.
*            out->write( zahl1 / zahl2 ).
*        WHEN OTHERS.
*            out->write( 'Falsche Operation' ).
*      ENDCASE.

  DATA lv_meins TYPE z16_dataelement.
  lv_meins = 'Hello World Hello World Hello World'.
  out->write( lv_meins ).

  ENDMETHOD.

ENDCLASS.
