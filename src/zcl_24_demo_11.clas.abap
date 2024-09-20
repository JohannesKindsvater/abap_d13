CLASS zcl_24_demo_11 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_24_demo_11 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration interner Tabellen

    DATA flight   TYPE z24_flight.
    DATA flights  TYPE z24_flights. " TYPE <Tabellentyp>
    DATA flights2 TYPE TABLE OF z24_flight.                " TYPE TABLE OF <Strukturtyp>
    DATA flights3 TYPE TABLE OF /dmo/flight.
    DATA flights4 TYPE z24_flights.

    flight-carrier_id    = 'LH'.
    flight-connection_id = '0401'.
    flight-flight_date   = sy-datlo + 50.

    " Einfügen von Datensätzen
    flights = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                       ( flight_date = sy-datlo )
                       ( )
                       ( flight_price = '777.99' currency_code = 'EUR' carrier_id = 'UA' )
                       ( flight )
                       ( flight ) ).

    " Hinzufügen von Datensätzen
    flight-flight_date -= 30.
    APPEND flight TO flights.
    flight-flight_date -= 90.
    flights = VALUE #( BASE flights
                       ( flight ) ).

    "Kopieren interner Tabellen
    flights2 = flights.
    flights3 = CORRESPONDING #( flights ).
    "flights.forEach(f -> System.out.println(f);    flights.forEach(System.out::println);
    "flights.forEach(f -> f.doSomething());   flights.forEach(Flight::doSomething);
    flights4 = VALUE #( FOR f IN flights ( f ) ).


    "Lesen von Datensätzen
    flight = flights[ 3 ]. "per Index
    flight = flights[ carrier_id = 'LH' connection_id = '0400' ]. "per Kommponente, erster Wert

    LOOP AT flights INTO flight WHERE connection_id > '399'.
      out->write( flight ).
    ENDLOOP.

    "Ändern von Datensätzen
    flights[ 3 ]-flight_price = '500'. "Ändern des Flugpreises in Zeile 3
    flights[ carrier_id = 'LH' connection_id = '0400' ]-flight_price = '199.95'. "Erster Datensatz wird geändernt

    "In der internen Tabelle flights passiert nichts, da man nur in der kopierten Hilfsvariable den Preis jeder Zeile ändert
    LOOP AT flights INTO flight WHERE connection_id > '399'.
      flight-currency_code = 'EUR'.
    ENDLOOP.

    "Deshalb
    LOOP AT flights reference INTO DATA(flight2).
      flight2->currency_code = 'EUR'.
    ENDLOOP.

    "Sortieren interner Tabellen
    SORT flights by carrier_id DESCENDING connection_id ASCENDING flight_date DESCENDING.


    "Löschen von Datensätzen
    DELETE flights INDEX 2.
    DELETE flights WHERE carrier_id IS INITIAL.



    out->write( flights ).
    out->write( '----------------------------------------------------------------' ).
    out->write( flights2 ).
    out->write( '----------------------------------------------------------------' ).
    out->write( flights3 ).
    out->write( '----------------------------------------------------------------' ).
    out->write( flights4 ).

  ENDMETHOD.
ENDCLASS.
