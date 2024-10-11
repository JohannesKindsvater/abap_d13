CLASS zcl_16_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

* Task 1: Simple Structure
**********************************************************************
    TYPES:
      BEGIN OF st_address,
        street      TYPE /dmo/street,
        postal_code TYPE /dmo/postal_code,
        city        TYPE /dmo/city,
        country     TYPE land1,
      END OF st_address.

* Task 2: Nested Structure
**********************************************************************
*    TYPES:
*      BEGIN OF st_name,
*        first_name TYPE /dmo/first_name,
*        last_name  TYPE /dmo/last_name,
*      END OF st_name.
*
*    TYPES: BEGIN OF st_person,
*             name    TYPE st_name,
*             address TYPE st_address,
*           END OF st_person.


*Task 3: Named Includes
**********************************************************************
*    TYPES BEGIN OF st_person_inc.
*    INCLUDE TYPE st_name    AS name.
*    INCLUDE TYPE st_address AS address.
*    TYPES END OF st_person_inc.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_structure IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Task 1
**********************************************************************
    DATA address TYPE z16s_adress.

    address-street      = 'Dietmar-Hopp-Allee 16'.
    address-postal_code = '69190'.
    address-city        = 'Walldorf'.
    address-country     = 'DE'.

* Task 2
**********************************************************************
    DATA person TYPE z16s_person.

    person-name-first_name     = 'Dictionary'.
    person-name-last_name      = 'ABAP'.
    person-address-street      = 'Dietmar-Hopp-Allee 16'.
    person-address-postal_code = '69190'.
    person-address-city        = 'Walldorf'.
    person-address-country     = 'DE'.

* Task 2
**********************************************************************
    DATA person2 TYPE z16s_person_inc.

    person2-name-first_name     = 'Dictionary'.
    person2-name-last_name      = 'ABAP'.
    person2-address-street      = 'Dietmar-Hopp-Allee 16'.
    person2-address-postal_code = '69190'.
    person2-address-city        = 'Walldorf'.
    person2-address-country     = 'DE'.
* or -------------------------------------------------------
    person2-first_name  = 'Dictionary'.
    person2-last_name   = 'ABAP'.
    person2-street      = 'Dietmar-Hopp-Allee 16'.
    person2-postal_code = '69190'.
    person2-city        = 'Walldorf'.
    person2-country     = 'DE'.

    DATA lt_z16_employ TYPE STANDARD TABLE OF z16_employ.
    DATA ls_z16_employ2 TYPE z16_employ.                    "Einzeiler, der aber dieselbe Struktur hat, wie die Tabelle
    DATA ls_z00_employ3 LIKE LINE OF lt_z16_employ.         "Einzeiler ..^ jedoch andere Syntax, jedoch Nachteil.

    SELECT FROM z16_employ
    FIELDS *
    INTO TABLE @lt_z16_employ.
    out->write( lt_z16_employ ).

    out->write( '------------------------' ).

    "-----------------------------
    " Massenzugriff
    "-----------------------------

    LOOP AT lt_z16_employ INTO ls_z16_employ2 FROM 3 TO 5.
      out->write( ls_z16_employ2 ).
    ENDLOOP.

    LOOP AT lt_z16_employ INTO ls_z16_employ2 WHERE employee_id < 20.
      out->write( ls_z16_employ2 ).
    ENDLOOP.

    out->write( '------------------------' ).

    "-----------------------------
    " Einzelzugriff
    "-----------------------------

    ls_z16_employ2 = lt_z16_employ[ 3 ].
    out->write( ls_z16_employ2 ).
    out->write( lt_z16_employ[ 3 ] ).
    ls_z16_employ2 = VALUE #( lt_z16_employ[ employee_id = 20 ] OPTIONAL ).
    out->write( ls_z16_employ2 ).


    out->write( '------------------------' ).

    TYPES tt_hash TYPE HASHED TABLE OF z16_employ
                  WITH unique KEY client employee_id.

    TYPES tt_sorted TYPE SORTED TABLE OF z16_employ              " Hashed Tabelle -> Immer Primärschlüssel angeben
                    WITH NON-UNIQUE KEY entry_date birth_date.   " Sortierte Tabelle -> Angeben, nach welchen Attritbuten sortiert werden soll

    DATA lt_ddic_tt TYPE z16_tabletype.
    "DATA lt_ddic_tt2 TYPE STANDARD TABLE OF z16_tabletype.

  ENDMETHOD.
ENDCLASS.
