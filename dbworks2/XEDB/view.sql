--view 검색
SELECT * FROM emp_details_view;

-- employees 테이블과 emp_details_view를 조인하여 employee_id가 100인 직원의
-- employee_id, hire_date, department_name, job_title 출력
SELECT A.employee_id, A.hire_date, B.department_name, B.job_title
FROM employees A, emp_details_view B
WHERE A.employee_id = B.employee_id
AND A.employee_id = 100;




-- VIEW 생성
CREATE VIEW emp_dept_v1 AS
SELECT a.employee_id, a.last_name, a.department_id,
       b.department_name
FROM employees a,
     departments b
WHERE a.department_id = b.department_id;

SELECT * FROM emp_dept_v1;

SELECT * FROM departments;

DROP VIEW emp_dept_v1;

