CLASS zcl_24_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Definition eine lokalen Strukturtypen
    TYPES: BEGIN OF ty_flight,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
             flight_price  TYPE /dmo/flight_price,
             currency_code TYPE /dmo/currency_code,
           END OF ty_flight.

    "Deklaration einer Struktur (Variablen)

    DATA flight TYPE ty_flight.

    "Zugriff auf die Strukturkomponenten
    flight-carrier_id = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date = cl_abap_context_info=>get_system_date(  ).

    flight = VALUE #( BASE flight
                      connection_id = '0401'
                      flight_price = '7333.99'
                      currency_code = 'EUR' ).

    out->write( flight-flight_date ).



  ENDMETHOD.
ENDCLASS.
