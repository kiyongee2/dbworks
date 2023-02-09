-- 테이블 전체 조회
SELECT * FROM employees;

-- employees 테이블을 emp로 복사하기 --
CREATE TABLE emp AS SELECT * FROM employees;

-- 특정 열만 조회
SELECT employee_id, first_name, last_name
FROM emp;

-- AS를 사용하여 별칭 만들기(AS 생략 가능)
SELECT employee_id AS 사원번호, first_name 이름, last_name 성
FROM emp;

-- ORDER BY를 이용한 정렬 : 급여가 많은 순으로 정렬하기
SELECT employee_id, first_name, last_name, salary
FROM emp ORDER BY salary DESC;

-- 데이터 값 연결하기 : 연결 연산자 '||'
SELECT employee_id, first_name ||' '||last_name AS name
FROM emp;

SELECT employee_id, first_name ||'@'||'gmail.com' AS email
FROM emp;

-- 데이터 값 계산하기 : 산술 연산자
SELECT employee_id, salary, salary+500, salary-100
FROM emp;

SELECT employee_id AS 사원번호, salary AS 급여, salary+500 AS 추가급여, salary-100 AS 인하급여
FROM emp;

-- DISTINCT를 사용한 중복값 제거

SELECT job_id, department_id
FROM emp;

SELECT DISTINCT job_id, department_id
FROM emp;

-- 행의 데이터 값 조회하는 방법 : WHERE 조건절을 활용한 검색
-- employee_id가 100인 사원 정보 --
SELECT * 
FROM emp
WHERE employee_id = 100;

SELECT * 
FROM emp
WHERE employee_id <> 100;

SELECT * 
FROM emp
WHERE first_name = 'David';

-- SQL 연산자
SELECT * 
FROM emp
WHERE salary BETWEEN 10000 AND 20000;

-- salary가 10000 또는 17000 또는 24000인 사원정보 --
SELECT * 
FROM emp
WHERE salary IN (10000, 17000, 24000);

-- job_id가 AD로 시작하는 사원 정보 --
SELECT * 
FROM emp
WHERE job_id LIKE 'AD%';

-- job_id가 AD로 시작하고 문자열이 3자리인(공백문자포함) 사원 정보
SELECT * 
FROM emp
WHERE job_id LIKE 'AD___';


-- magager_id가 null인 경우 --
SELECT * 
FROM emp
WHERE manager_id IS NULL;

-- 논리 연산자 : AND, OR - job_id가 'IT_PROG'이고 salary가 4000을 초과하는 사원 --
SELECT * 
FROM  emp
WHERE salary > 4000
AND   job_id = 'IT_PROG' ;

SELECT * 
FROM  emp
WHERE salary > 4000
AND   job_id = 'IT_PROG' 
OR    job_id = 'FI_ACCOUNT';

SELECT * 
FROM emp
WHERE manager_id IS NOT NULL;


