-- Archivo: transaccion_basica.sql
BEGIN
    UPDATE regions 
    REGION_NAME = 'Antartida' 
    WHERE region_id = 5;

    -- Si todo sale bien:
    COMMIT;
    -- Si hay error de lógica se usaría: ROLLBACK;
END;
/