-- Archivo: proc_actualizar_salario.sql
CREATE OR REPLACE PROCEDURE sp_actualizar_salario (
    p_id_emp     IN NUMBER,
    p_porcentaje IN NUMBER
) AS
BEGIN
    UPDATE employees 
    SET salary = salary * (1 + p_porcentaje / 100)
    WHERE employee_id = p_id_emp;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salario actualizado con éxito para el empleado ID: ' || p_id_emp);
END;
/