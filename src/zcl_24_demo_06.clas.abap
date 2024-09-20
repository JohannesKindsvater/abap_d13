CLASS zcl_24_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Deklaration einer "Liste"
    DATA numbers TYPE TABLE OF i. "List<Integer> number = new ArrayList<>();

    "Einfügen von Datensätzen

    numbers = VALUE #( ( 6 ) ( 7 ) ( 9 ) ( 10 ) ).

    APPEND -3 TO numbers.
    APPEND 7 TO numbers.
    APPEND 7 TO numbers.

    "Lesen von Datensätzen
    TRY.
        out->write( | { numbers[ 3 ] } | ).
      CATCH cx_sy_itab_line_not_found INTO DATA(x).
        out->write( x->get_text(  ) ).
    ENDTRY.

    IF line_exists( numbers[ 3 ] ).
      out->write( | Letzte Zahl:{ lines( numbers ) } | ).
    ENDIF.


    "for(int number : numbers){
    "   if(number >=0){
    "     System.out.println(number);
    "   }
    " }
    LOOP AT numbers INTO DATA(number) WHERE table_line > 0.
      out->write( number ).
    ENDLOOP.

    "Länge
    out->write( |Länge der Liste: { lines( numbers ) }| ).

    "Ausgabe
    out->write( numbers ).

  ENDMETHOD.
ENDCLASS.
