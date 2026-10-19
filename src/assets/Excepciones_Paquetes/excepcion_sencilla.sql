-- Archivo: excepcion_sencilla.sql
SET SERVEROUTPUT ON;

DECLARE
    v_resultado NUMBER;
BEGIN
    v_resultado := 100 / 0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error crítico: Está intentando realizar una división entre cero.');
END;
/