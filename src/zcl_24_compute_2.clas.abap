CLASS zcl_24_compute_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_24_COMPUTE_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Declarations
**************************

    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA op TYPE c LENGTH 1.

    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA output TYPE c LENGTH 30.


* Input Values
**************************

    number1 = 1.
    number2 = 0.
    op = '/'.

* Calculation
**************************

*    DATA(result) = number1 / number2.



    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
      TRY.
        result = number1 / number2.
      CATCH cx_sy_zerodivide.
        output = |Man kann nicht durch 0 teilen.|.
    ENDTRY.
      WHEN OTHERS.
        output = | { op } ist keine korrekte Eingabe.|.
    ENDCASE.


    "DATA(output) = |{ number1 } { op } { number2 } = { result }|.
    IF output IS INITIAL.
      output = |{ number1 } { op } { number2 } = { result }|.
    ENDIF.

* Output
**************************

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
