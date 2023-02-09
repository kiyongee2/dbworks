SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;

-- 동등 조인(employees와 departments 테이블은 department_id로 연결되어 있다.)
SELECT a.employee_id, a.last_name, b.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id;
--AND a.employee_id = 101;

-- employee_id가 101인 직원의 job_history 출력
SELECT a.first_name, a.last_name, b.*
FROM employees a, job_history b
WHERE a.employee_id = b.employee_id
AND a.employee_id = 101;

-- 각 직원이 어느 부서에 속하는지와 부서의 소재지가 어디인지 조회
SELECT a.employee_id, a.department_id, b.department_name, c.location_id, c.city
FROM employees a, departments b, locations c
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;

SELECT COUNT(*) 조인된건수
FROM employees A, departments B
WHERE A.department_id = B.department_id;

-- department_id가 NULL인 직원 찾기
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id IS NULL;

-- 양 테이블을 department_id로 외부 조인하여 department_id가 null인 값 출력
SELECT a.employee_id, a.last_name, b.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id(+);

-- 자체 조인 : 직원별 담당 매니저가 누구인지 조회
SELECT a.employee_id, a.first_name, a.last_name, a.manager_id,
       b.first_name || ' ' || b.last_name manager_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id
ORDER BY a.employee_id;