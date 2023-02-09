-- 서브 쿼리
-- 전 사원의 평균 급여 이상을 받는 사원 수 조회
SELECT * FROM employees;

SELECT ROUND(AVG(salary), 2) 평균급여 FROM employees;

SELECT count(*) 평균급여이상_사원수
FROM employees
WHERE salary >= (SELECT AVG(salary) FROM employees);

-- job_history 테이블에 있는 employee_id와 job_id가 같은 사원 조회
SELECT * FROM job_history;

SELECT employee_id, first_name, job_id
FROM employees
WHERE (employee_id, job_id) IN (SELECT employee_id, job_id
                                FROM job_history);
                                
-- 조인 조건이 걸린 서브 쿼리
-- 부서 location_id가 1800인 department_id를 가지는 사원 검색
SELECT * FROM departments;

-- 조인(기본키, 외래키 관계)
SELECT * FROM employees a, departments b
  WHERE a.department_id = b.department_id
    AND b.location_id = 1800;
  
-- 서브 쿼리(단일 자료인 경우)
SELECT * FROM employees a
    WHERE a.department_id = (SELECT b.department_id
                                FROM departments b 
                             WHERE b.location_id = 1800);
                             
-- 서브 쿼리(다중 자료인 경우)
SELECT * FROM employees a
    WHERE a.department_id IN (SELECT b.department_id
                                FROM departments b 
                             WHERE b.location_id = 1700);
                             
  



