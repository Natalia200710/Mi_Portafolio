-- Archivo: transaccion_savepoint.sql
SET SERVEROUTPUT ON;

BEGIN
    -- Transacción principal
    UPDATE departments SET department_name = 'Tech Global' WHERE department_id = 10;
    SAVEPOINT sp_punto_seguro;

    -- Operación secundaria sujeta a revisión
    BEGIN
        UPDATE employees SET salary = salary * 2 WHERE department_id = 999; -- Departamento inexistente o error simulado
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error detectado en sub-operación. Revirtiendo al Savepoint.');
            ROLLBACK TO sp_punto_seguro;
    END;

    -- Se confirma únicamente lo seguro
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transacción completada de forma segura.');
END;
/