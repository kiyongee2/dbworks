-- employees 테이블 복사(특정 칼럼) --
CREATE TABLE t_employee AS
SELECT employee_id, first_name, last_name, salary, job_id 
FROM employees;

SELECT * FROM t_employee;

-- 테이블 삭제 --
DROP TABLE t_employee;

-- first_name이 'David'이고, salary가 4000을 초과하는 직원
SELECT * FROM t_employee
WHERE first_name = 'David' 
AND salary > 4000;

-- 문제 : salary가 7000을 초과하고, job_id가 'IT' 나 'FI'로 시작하는 직원을 검색하세요.
SELECT * FROM t_employee
WHERE salary > 7000 
AND job_id LIKE 'IT%'
OR job_id LIKE 'FI%';

SELECT first_name, hire_date, job_id, salary
FROM employees
WHERE salary IN (10000, 17000, 24000);


SELECT COUNT(salary)
FROM t_employee;

SELECT SUM(salary)
FROM t_employee;

SELECT ROUND(AVG(salary), 2)
FROM t_employee;

-- 직무별 급여 총액과 급여 평균
SELECT job_id, sum(salary), AVG(salary)
FROM employees
GROUP BY job_id;

-- 직무별 급여 총액이 30000 이상과 급여 평균
SELECT job_id, sum(salary), AVG(salary)
FROM employees
GROUP BY job_id
HAVING sum(salary) >= 30000;







