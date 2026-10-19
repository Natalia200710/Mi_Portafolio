-- Archivo: paquete_gestion_empleados.sql
-- 1. Especificación del Paquete
CREATE OR REPLACE PACKAGE pkg_gestion_emp AS
    ex_salario_bajo EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_salario_bajo, -20002);

    PROCEDURE validar_y_actualizar(p_id IN NUMBER, p_nuevo_salario IN NUMBER);
END pkg_gestion_emp;
/

-- 2. Cuerpo del Paquete
CREATE OR REPLACE PACKAGE BODY pkg_gestion_emp AS
    PROCEDURE validar_y_actualizar(p_id IN NUMBER, p_nuevo_salario IN NUMBER) IS
    BEGIN
        IF p_nuevo_salario < 500 THEN
            RAISE_APPLICATION_ERROR(-20002, 'El salario no puede estar por debajo del mínimo legal.');
        END IF;

        UPDATE employees SET salary = p_nuevo_salario WHERE employee_id = p_id;
        COMMIT;
    END validar_y_actualizar;
END pkg_gestion_emp;
/