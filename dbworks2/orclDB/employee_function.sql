-- 그룹 함수
SELECT COUNT(salary) 급여행수 
FROM emp;

SELECT COUNT(*) 급여행수 
FROM emp;

SELECT SUM(salary) 합계, ROUND(AVG(salary),2) 평균
FROM emp;

SELECT MAX(salary) 최대값, MIN(salary) 최소값
FROM emp;

SELECT MAX(first_name) 최대문자값, MIN(first_name) 최소문자값
FROM emp;

-- GROUP BY 절 : company_id가 10이상인 직원에 대해 job_id별로 그룹화하여 
-- job_id별 총 급여와 평균 급여를 구하고, job_id별 총 급여를 기준으로 내림차순 정렬
SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   emp
WHERE  employee_id >= 10
GROUP BY job_id
ORDER BY 직무별_총급여 DESC;

-- HAVING 사용 : 그룹화된 값에 조건식 적용
SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   emp
WHERE  employee_id >= 100
GROUP BY job_id
HAVING   SUM(salary) > 30000
ORDER BY 직무별_평균급여 DESC;