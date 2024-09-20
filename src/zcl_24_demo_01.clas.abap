CLASS zcl_24_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_24_demo_01 IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

  " String, Character,
  " Integer, Byte, Short, (ganze Zahlen),
  " Float, Double
  " Boolean,
  " Date, Time

  " Zeichenketten
  TYPES ty_first_name TYPE string.  "Beispiel: 'Johannes Kindsvater'
  TYPES ty_last_name TYPE c LENGTH 10. "Beispiel: 'Kindsvater'
  TYPES ty_iuser TYPE n LENGTH 6. "Beispiel: '749955'
  TYPES ty_birht_date TYPE d. "Beispiel: '20060128' (man könnte auch length 8)
  TYPES ty_birth_time TYPE t. "Beispiel '043023' (Zeitangabe --> Stunde, Minute, Sekunde

  " Ganze Zahlen
  TYPES ty_number TYPE i. "Beispiel: -474

  " Kommazahlen
  TYPES ty_salary_in_euro TYPE p LENGTH 16 DECIMALS 2. "Beispiel: '54632.88'

  " 'Boolscher Wahrheitswert'
  TYPES ty_error_flag TYPE c LENGTH 1. "Beispiel: 'X' oder abap_true / abap_true / abap_undefined

  "----
  " Deklaration und Initialisierung
  "----
  DATA first_name TYPE string. "DATA deklariert Variable
  DATA last_name TYPE ty_last_name.
  DATA birth_city TYPE /dmo/city. "Meta Daten -> Globale Variablen (vorgesetzt, wie es aussehen soll)
  DATA number TYPE ty_number.


  out->write( first_name ).

  first_name = 'Johannes'.
  last_name = 'Kindsvater'.
  birth_city = 'Leverkusen'.
  number = '8673'.


  out->write( first_name ).

  DATA iuser TYPE ty_iuser VALUE '054906'.
  DATA(birth_date) = '19820104'.  "So nicht verwenden, da der Compiler hier nur eine Zeichenkette sieht

  iuser = '749955'.

  CLEAR iuser. "iuser Wert löschen, Initialwert bleibt jedoch bestehen.

  out->write( first_name ).
  out->write( last_name ).
  out->write( iuser ).
  out->write( birth_city ).

  CONSTANTS pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'. "Konstante Variablen kann man nicht mehr ändern




  ENDMETHOD.

ENDCLASS.
