/* Construir una función que dados 2 números, a y b, permita retornar la suma
de todos los números pares entre a y b */
CREATE OR REPLACE FUNCTION fn_sumapares(a NUMBER, b NUMBER)
RETURN NUMBER
IS
    suma NUMBER := 0;
BEGIN
    FOR numero IN a .. b LOOP
        IF MOD(numero, 2) = 0 THEN
            suma := suma + numero;
        END IF;
    END LOOP;
    RETURN suma;
END;

DECLARE
    r_suma NUMBER;
    numero_a NUMBER := &a;
    numero_b NUMBER := &b;
BEGIN
    r_suma := fn_sumapares(numero_a, numero_b);
    DBMS_OUTPUT.PUT_LINE('Suna de pares entre ' || numero_a || ' y ' || numero_b || ' es ' || r_suma);
END;

/* Construir un procedimiento que permita retornar, dados 2 números (a y b) la suma de los pares y la suma de los impares
de todos los números entre a y b */
CREATE OR REPLACE PROCEDURE sp_sumas(a NUMBER, b NUMBER, suma_pares OUT NUMBER, suma_impares OUT NUMBER)
IS
BEGIN
    suma_pares := 0;
    suma_impares := 0;
    FOR numero IN a .. b LOOP
        IF MOD(numero, 2) = 0 THEN
            suma_pares := suma_pares + numero;
        ELSE
            suma_impares := suma_impares + numero;
        END IF;
    END LOOP;
END;

-- Ahora probamos el SP (store procedure)
DECLARE
    suma_p NUMBER;
    suma_i NUMBER;
    numero_a NUMBER := &a;
    numero_b NUMBER := &b;    
BEGIN
    sp_sumas(numero_a, numero_b, suma_p, suma_i);
    DBMS_OUTPUT.PUT_LINE('Suna de pares entre ' || numero_a || ' y ' || numero_b || ' es ' || suma_p);
    DBMS_OUTPUT.PUT_LINE('Suna de impares entre ' || numero_a || ' y ' || numero_b || ' es ' || suma_i);
END;