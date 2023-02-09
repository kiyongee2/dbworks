-- NVL(열이름, 치환값) --
SELECT * 
FROM employees
WHERE manager_id IS NULL;

SELECT last_name, NVL(manager_id, employee_id)
FROM employees
WHERE manager_id IS NULL;


SELECT first_name, salary * commission_pct
FROM employees
ORDER BY commission_pct;

SELECT first_name, salary * NVL(commission_pct, 1)
FROM employees
ORDER BY commission_pct;
