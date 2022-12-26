SET SERVEROUTPUT ON;
DECLARE
  v_valor NUMBER;
  v_cadena VARCHAR2(30);
BEGIN
  v_valor := 29;
  v_cadena := 'Aprendiendo PL/SQL';
  DBMS_OUTPUT.PUT_LINE(v_valor);
  DBMS_OUTPUT.PUT_LINE('Contenido de la variable cadena es ' || v_cadena);
END;

DECLARE
  v_valor NUMBER := &NUMERO;
BEGIN
  IF v_valor >= 0 THEN
    DBMS_OUTPUT.PUT_LINE('Valor ingresado es mayor o igual a cero');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Valor ingresado es negativo');
  END IF;
END;

DECLARE
  v_x NUMBER := &X;
BEGIN
  IF v_x >= 30 AND MOD(v_x, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Valor par mayor o igual a 30');
  ELSIF MOD(v_x, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Valor par menor a 30');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Valor es impar');
  END IF;
END;

-- Uso de ciclo FOR
DECLARE
  minimo NUMBER := 1;
  maximo NUMBER := 10;
BEGIN
  FOR numero IN minimo .. maximo LOOP
    DBMS_OUTPUT.PUT_LINE(numero);
  END LOOP;
END;

-- Uso de ciclo LOOP
DECLARE
  minimo NUMBER := 1;
  maximo NUMBER := 10;
  numero NUMBER;
BEGIN
  numero := minimo;
  LOOP 
    EXIT WHEN numero > maximo; 
    DBMS_OUTPUT.PUT_LINE(numero);
    numero := numero + 1;
  END LOOP;
END;

-- Uso de ciclo WHILE
DECLARE
  minimo NUMBER := 1;
  maximo NUMBER := 10;
  numero NUMBER;
BEGIN
  numero := minimo;
  WHILE numero <= maximo LOOP   
    DBMS_OUTPUT.PUT_LINE(numero);
    numero := numero + 1;
  END LOOP;
END;