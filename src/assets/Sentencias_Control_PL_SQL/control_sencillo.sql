-- Archivo: control_sencillo.sql
SET SERVEROUTPUT ON;

DECLARE
    v_calificacion NUMBER := 85;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Calificación evaluada: ' || v_calificacion);

    IF v_calificacion >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Resultado: Sobresaliente');
    ELSIF v_calificacion >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Resultado: Aprobado');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Resultado: Reprobado');
    END IF;
END;
/