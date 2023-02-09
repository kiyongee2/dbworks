-- 뷰 --
SELECT * FROM employees;

SELECT * FROM departments;

-- 해당 사원이 속한 부서명 검색 --
SELECT a.employee_id, a.last_name, a.department_id,
       b.department_name
FROM employees a,
     departments b
WHERE a.department_id = b.department_id;

-- 위의 테이블로 뷰 생성 --
CREATE OR REPLACE VIEW emp_dept_v1 AS
SELECT a.employee_id, a.last_name, a.department_id,
       b.department_name
FROM employees a,
     departments b
WHERE a.department_id = b.department_id;

SELECT *
FROM emp_dept_v1;