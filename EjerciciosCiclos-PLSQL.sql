/*
Construir un bloque que permita sumar todos los pares que hay entre
los valores a y b
*/
SET SERVEROUTPUT ON;
DECLARE
    a NUMBER := &a;
    b NUMBER := &b;
    suma NUMBER := 0;
BEGIN
    FOR numero IN a .. b LOOP
        IF MOD(numero, 2) = 0 THEN
            suma := suma + numero;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Suma de pares entre ' || a || ' y ' || b || ' = ' || suma);
END;

/*
Construir un bloque que permita imprimir un mensaje que indique si un número
es primo o no
*/
DECLARE
    numero NUMBER := &numero;
    esPrimo BOOLEAN := True;
BEGIN
    /* Revisa los divisores de numero */
    FOR divisor IN 2 .. numero/2 LOOP
        IF MOD(numero, divisor) = 0 THEN
            esPrimo := False;
            EXIT WHEN NOT esPrimo;
        END IF;
    END LOOP;
    /* Verifica la condición de salida */
    IF esPrimo THEN
        DBMS_OUTPUT.PUT_LINE(numero || ' es primo');
    ELSE
        DBMS_OUTPUT.PUT_LINE(numero || ' NO es primo');
    END IF;
END;

/*
Construir un bloque que permita leer un número entero y muestre por pantalla un 
triángulo rectángulo como el de más abajo
1
3 1
5 3 1
7 5 3 1
9 7 5 3 1
*/

DECLARE
    numero NUMBER := &numero;
    un_numero NUMBER := 1;
    linea VARCHAR2(500);
    x NUMBER;
BEGIN
    /* Para cada línea del triángulo */
    WHILE un_numero <= numero LOOP
        /* Forma la línea con los números */
        linea := '';
        x := 2*un_numero - 1;
        WHILE x >= 1 LOOP
            linea := linea || TO_CHAR(x) || ' ';
            x := x - 2;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(linea);
        un_numero := un_numero + 1;
    END LOOP;
END;
