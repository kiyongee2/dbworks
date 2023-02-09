-- select구문 --
-- 사원 테이블에서 급여가 5000이 넘는 사원번호와 사원명 조회

SELECT employee_id, first_name, last_name, salary, job_id
FROM employees
WHERE salary > 10000  OR JOB_ID = 'IT_PROG'
ORDER BY salary;

SELECT employee_id as 사원번호, first_name||' '||last_name as 이름
FROM employees;

SELECT DISTINCT job_id, department_id
FROM employees;

SELECT a.employee_id, a.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id;


