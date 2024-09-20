CLASS zcl_24_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC ..


  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Variablen
    CONSTANTS count TYPE i VALUE 20.

    "Deklaration
    DATA numbers TYPE TABLE OF i.
    DATA output TYPE TABLE OF string.

    "Iteration
    DO count TIMES.
      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.
        WHEN OTHERS.
          APPEND numbers[ sy-index - 1 ]  + numbers[ sy-index - 2 ] TO numbers.
      ENDCASE.
    ENDDO.

    DATA(counter) = 0.
    LOOP AT numbers INTO DATA(number).
      APPEND |{ sy-tabix WIDTH = 10 ALIGN = LEFT } : { number  WIDTH = 10 ALIGN = RIGHT }| TO output.
    ENDLOOP.

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
