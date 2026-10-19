-- Archivo: cursor_implicito.sql
SET SERVEROUTPUT ON;

DECLARE
    v_nombre employees.first_name%TYPE;
BEGIN
    SELECT first_name 
    INTO v_nombre 
    FROM employees 
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Empleado encontrado: ' || v_nombre);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el registro.');
END;
/