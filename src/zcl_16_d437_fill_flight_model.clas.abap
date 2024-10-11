CLASS zcl_16_d437_fill_flight_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_d437_fill_flight_model IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS lv_tabname TYPE c LENGTH 20 VALUE 'Z16_437_TRAVEL'.

    "Daten laden aus Originaltabelle
    SELECT FROM /dmo/travel
    FIELDS *
    INTO TABLE @DATA(lt_travel).

    "Zieltabelle löschen
    DELETE FROM (lv_tabname).
    "Daten in Zieltabelle schreiben
    INSERT (lv_tabname) FROM TABLE @lt_travel.

  ENDMETHOD.
ENDCLASS.
