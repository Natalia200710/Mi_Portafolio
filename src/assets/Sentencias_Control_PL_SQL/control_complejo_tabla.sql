-- Archivo: control_complejo_tabla.sql
SET SERVEROUTPUT ON;

DECLARE
    v_total_pares   NUMBER := 0;
    v_suma_impares  NUMBER := 0;
BEGIN
    -- Simulación de procesamiento por lotes mediante bucle FOR
    FOR i IN 1..20 LOOP
        IF MOD(i, 2) = 0 THEN
            v_total_pares := v_total_pares + 1;
        else
            v_suma_impares := v_suma_impares + i;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- REPORTE DE PROCESAMIENTO ---');
    DBMS_OUTPUT.PUT_LINE('Total de números pares encontrados: ' || v_total_pares);
    DBMS_OUTPUT.PUT_LINE('Suma acumulada de números impares: ' || v_suma_impares);
END;
/