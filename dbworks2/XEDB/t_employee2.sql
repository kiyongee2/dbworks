-- function
CREATE TABLE t_employee2 AS
SELECT * FROM employees;

SELECT * FROM t_employee2;

-- 문자 타입 함수
SELECT last_name,
       LOWER(last_name) LOWER적용,
       UPPER(last_name) UPPER적용,
       email,
       INITCAP(email) INITCAP적용
FROM t_employee2;

-- job_id의 첫째 자리부터 시작해서 두 개의 문자 출력
SELECT job_id, SUBSTR(job_id, 1, 2) 직무코드
FROM t_employee2;

SELECT COUNT(*) AS 급여행수
FROM t_employee2;

-- job_id 문자열 값이 ACCOUNT이면 ACCNT로 출력
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 결과
FROM t_employee2;

SELECT COUNT(salary) AS 급여행수
FROM t_employee2;

--first_name에 대해 12자리의 문자열 자리를 *를 채워서 출력하기
SELECT first_name, LPAD(first_name, 12, '*') 결과
FROM t_employee2;

-- salary를 30일로 나눈 후 소수 자리수에 따라 반올림한 값 출력
SELECT salary,
       salary/30 일급,
       ROUND(salary/30, 1) 결과1,
       ROUND(salary/30, 0) 결과2,
       ROUND(salary/30, -1) 결과3
FROM t_employee2;

-- salary를 30일로 나눈 후 소수 자리수에 따라 절삭(버린)한 값 출력
SELECT salary,
       salary/30 일급,
       TRUNC(salary/30, 1) 결과1,
       TRUNC(salary/30, 0) 결과2,
       TRUNC(salary/30, -1) 결과3
FROM t_employee2;

-- department_id가 100인 직원에 대해 입사후 총 개월수 출력
-- department_id, 오늘 날짜, hire_date, 총 개월수 출력
SELECT department_id, SYSDATE, hire_date, 
       TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date), 0) 총_개월수
FROM t_employee2
WHERE department_id = 100;

-- employee_id가 100과 106사이인 직원의 hire_date에 3개월을 더한 값과
-- 3개월을 뺀 값 출력
SELECT employee_id, hire_date, 
       ADD_MONTHS(hire_date, 3) 더하기_결과,
       ADD_MONTHS(hire_date, -3) 빼기_결과
FROM t_employee2
WHERE employee_id BETWEEN 100 AND 106;

-- 자동 타입 변환
SELECT 1 + '2'
FROM DUAL;

-- 날짜 형식 변환
SELECT TO_CHAR(SYSDATE, 'YY') 년도,
       TO_CHAR(SYSDATE, 'YYYY') 년도_4,
       TO_CHAR(SYSDATE, 'MM') 월,
       TO_CHAR(SYSDATE, 'DD') 일,
       TO_CHAR(SYSDATE, 'YY/MM/DD') 날짜
FROM DUAL;

-- 시간 형식 변환
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') 시간형식, 
       TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') 날짜와시간
FROM DUAL;

-- 숫자 형식 변환
SELECT TO_NUMBER('123')
FROM DUAL;

-- 날짜 형식 변환
SELECT TO_DATE('20190515', 'YYMMDD')
FROM DUAL;

--그룹 함수
SELECT SUM(salary) AS 합계, 
       ROUND(AVG(salary), 2) AS 평균
FROM t_employee2;

SELECT MAX(salary) AS 최대값, 
       MIN(salary) AS 최소값
FROM t_employee2;

SELECT MAX(first_name) AS 최대문자값, 
       MIN(first_name) AS 최소문자값
FROM t_employee2;

-- 직무별 급여 및 급여 평균
SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM t_employee2
WHERE employee_id >= 100
GROUP BY job_id
ORDER BY 직무별_평균급여 DESC;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM t_employee2
WHERE employee_id >= 100
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC;
