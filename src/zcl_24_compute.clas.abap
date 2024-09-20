CLASS zcl_24_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA number1 TYPE i.
  DATA number2 TYPE i.

  number1 = -5.
  number2 = 5.

  DATA(result) = number1 / number2.

  out->write( result ).

  DATA s_number1 TYPE c LENGTH 1 VALUE 6.
  DATA s_number2 TYPE c LENGTH 1 VALUE 3.
  DATA s_number3 TYPE c LENGTH 1 VALUE 2.


  DATA(output) = |{ s_number1 } / { s_number2 } = { s_number3 }|.
  out->write( output ).

  DATA number4 TYPE i VALUE -8.
  DATA number5 TYPE i VALUE 3.

  out->write( number4 / number5 ).

  DATA result2 TYPE p LENGTH 16 DECIMALS 2.

  result2 = number4 / number5.

  out->write( result2 ).






  ENDMETHOD.
ENDCLASS.
