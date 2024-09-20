CLASS zcl_24_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA flight_date TYPE /dmo/flight_date VALUE '20240917'.
    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.

 "----
    "Verzweigungen
 "----

    " Logische Operatoren: AND, OR, NOT
    " Vergleichsoperatoren: <, <=, >, >=, =, <>

    IF ( flight_date >= '20240101' AND flight_date < '20250101' ) OR  NOT carrier_id = 'AA'.
      out->write( 'IF1 erfüllt' ).
    ELSE.
      out->write( 'IF1 nicht erfüllt' ).
    "ELSEIF.
    ENDIF.

    IF flight_date BETWEEN '20240101' AND '20241231' OR carrier_id IS INITIAL.
      out->write( 'IF2 erfüllt' ).
    ENDIF.

    carrier_id = ' '.
    IF carrier_id IS INITIAL. "carrier_id = ''.
      out->write( 'IF 3 erfüllt' ).
    ENDIF.

    out->write( cond #( WHEN  flight_date BETWEEN '20240101' AND '20241231' THEN 'COND erfüllt' ELSE 'COND nicht erfüllt' ) ).


"----
  "Fallunterscheidungen
"----
    carrier_id = 'LH'.

    CASE carrier_id.
    WHEN 'LH' OR 'lH' OR 'Lh' OR 'lh'.
      out->write( 'Lufthansa' ).
    WHEN 'AA' OR 'aa' OR 'aA' OR 'Aa'.
      out->write( 'American Airline' ).
    WHEN OTHERS.
      out->write( carrier_id ).
    ENDCASE.

    out->write(  SWITCH #( carrier_id WHEN 'LH' OR 'lH' OR 'Lh' OR 'lh' THEN 'Lufthansa' WHEN 'AA' OR 'aa' OR 'aA' OR 'Aa' THEN 'American Airlines' ELSE carrier_id ) ).
  ENDMETHOD.
ENDCLASS.
