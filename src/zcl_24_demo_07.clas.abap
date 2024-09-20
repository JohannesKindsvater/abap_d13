CLASS zcl_24_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " SELECT <Spalte 1>, <Spalte 2>, ...
    " FROM <Datenbankquelle>
    " WHERE <Bedinung>

    DATA flight_distance TYPE /dmo/flight_price.
    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA flight_prices TYPE TABLE OF /dmo/flight_price.
    DATA flights TYPE TABLE OF /dmo/flight.
    DATA flight TYPE /dmo/flight.

    " Lesender Zugriff auf einen Datensatz
    SELECT SINGLE
      FROM /dmo/connection
      FIELDS distance
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO @flight_distance.  "INTO @DATA (flight_distance).

    SELECT SINGLE FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = 'LH' AND connection_id = '0405'
      INTO @flight."@data(flight).
    IF sy-subrc <> 0.
      out->write( 'nix gefunden' ).
    ENDIF.


      "Lesender Zugriff auf mehrere Datensätze
      SELECT FROM /dmo/flight
        FIELDS *
        WHERE carrier_id = @carrier_id
        INTO TABLE @flights.


      out->write( flight ).
      out->write( flights ).

  ENDMETHOD.
ENDCLASS.
