-- Archivo: func_calcular_costo_anual.sql
CREATE OR REPLACE FUNCTION fn_calcular_costo_anual (
    p_id_emp IN NUMBER
) RETURN NUMBER IS
    v_salario_mensual  employees.salary%TYPE;
    v_comision         employees.commission_pct%TYPE;
    v_costo_anual      NUMBER;
BEGIN
    -- Consultar salario y comisión actual del empleado
    SELECT salary, NVL(commission_pct, 0)
    INTO v_salario_mensual, v_comision
    FROM employees
    WHERE employee_id = p_id_emp;

    -- Calcular el costo anual incluyendo bonificación estimada por comisión
    v_costo_anual := (v_salario_mensual * 12) + (v_salario_mensual * 12 * v_comision);

    RETURN v_costo_anual;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('El empleado no existe.');
        RETURN 0;
END;
/