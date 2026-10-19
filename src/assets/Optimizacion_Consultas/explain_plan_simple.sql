-- Archivo: explain_plan_simple.sql
EXPLAIN PLAN FOR
SELECT department_id, AVG(salary) AS promedio_salario
FROM employees
GROUP BY department_id;

-- Consultar el plan generado
SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY);