
-- 관계 
--1. 동등 조인
SELECT A.employee_id, a.department_id
FROM employees A, departments B
WHERE A.department_id = b.department_id;

SELECT A.first_name, B.*
FROM employees A, job_history B
WHERE A.employee_id = B.employee_id
AND A.employee_id = 101;

-- 각 직원의 소속 부서와 부서의 소재지 검색
SELECT A.employee_id, A.department_id, C.location_id, C.city
FROM employees A, departments B, locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;

-- 외부조인
SELECT A.employee_id, A.first_name, B.department_id, B.department_name
FROM employees A, departments B
WHERE A.department_id = b.department_id(+)
ORDER BY A.employee_id;