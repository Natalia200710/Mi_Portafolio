-- Archivo: ventana_optimizada_hr.sql
SELECT 
    department_id,
    first_name,
    salary,
    -- Función de ventana para ranking salarial por departamento
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as ranking_salario,
    -- Promedio móvil o comparativo directo optimizado
    ROUND(AVG(salary) OVER (PARTITION BY department_id), 2) as promedio_departamento
FROM employees
WHERE department_id IS NOT NULL;