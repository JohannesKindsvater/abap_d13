CLASS zcl_24_demo_24 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_24 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA result TYPE p LENGTH 16 DECIMALS 4.

" Artithmetische Operatoren
  result = 5 + 3.
  out->write( result ).
  result = 5 - 3.
  out->write( result ).
  result = 5 * 3.
  out->write( result ).
  result = 5 / 3.
  out->write( result ).

  "Inkrementieren / Dekrementieren
  CLEAR result.
  result = result + 1.
  result += 1.
  out->write( result ).
  result -= 1.
  out->write( result ).


  " Arithmetische Expressions
  result = round( val = '55.875' dec = 2 ).
  out->write( result ).
  result = round( val = '55.875' dec = -2 ).
  out->write( result ).

  "im ABAP Language Help nach Built-In function suchen, um Funktionen zu erhalten

  ENDMETHOD.
ENDCLASS.
