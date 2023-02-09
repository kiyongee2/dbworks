-- employees 테이블 사용하기
SELECT * FROM employees;

-- 별칭 : 칼럼 이름 AS 별칭
SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성
FROM employees;

-- 정렬 : ORDER BY - ASC(오름차순), DESC(내림차순)
SELECT employee_id, first_name, last_name, salary
FROM employees ORDER BY salary DESC;

-- 중복 제거
SELECT DISTINCT job_id, department_id 
FROM employees;

--null 찾기
SELECT employee_id, job_id, manager_id 
FROM employees 
--WHERE manager_id IS NULL;
WHERE manager_id IS NOT NULL;

SELECT * 
FROM employees 
--WHERE first_name = 'David';
WHERE employee_id <> 105;

SELECT employee_id, job_id, manager_id 
FROM employees 
--WHERE job_id LIKE 'IT%';
WHERE job_id LIKE '%ACCOUNT';

-- AND, IN
-- salary가 10000이상 20000이하의 자료 검색
SELECT employee_id, first_name, job_id, salary
FROM employees 
WHERE salary BETWEEN 10000 AND 20000;
--WHERE salary >= 10000 AND  salary <= 10000;

SELECT employee_id, first_name, job_id, salary
FROM employees 
WHERE salary IN (10000, 17000, 24000);

SELECT employee_id, first_name, job_id, salary
FROM employees 
WHERE salary > 4000
AND job_id = 'IT_PROG'
OR job_id = 'FI_ACCOUNT';






