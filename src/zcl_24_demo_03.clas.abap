CLASS zcl_24_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA word1 TYPE string VALUE 'Hello'.
  DATA word2 TYPE string VALUE 'World'.

  DATA date TYPE d VALUE '20062801'.

  out->write( |{ word1 } { word2 }| ).
  out->write( |Datum: { date  DATE = USER }| ).

  out->write( to_lower( word1 ) ).
  out->write( to_upper( word1 ) ).


  ENDMETHOD.
ENDCLASS.
