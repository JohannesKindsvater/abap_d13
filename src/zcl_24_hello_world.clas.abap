CLASS zcl_24_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Ausgabe (komplette Zeile auskommentieren)
    "Mit dem Stern muss man nicht am Anfang der Zeile ansetzen
    out->write( 'Hello World!' ).

  ENDMETHOD.
ENDCLASS.
