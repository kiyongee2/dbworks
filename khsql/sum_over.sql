CREATE TABLE EMPLOYEES (
	DEPARTMENT_ID	VARCHAR(2),
	NAME			VARCHAR(15),
	HIRE_DATE		DATE,
	SALARY			NUMBER
);

INSERT INTO EMPLOYEES VALUES('10','Jennifer',TO_DATE('2013-09-17'),4400);
INSERT INTO EMPLOYEES VALUES('10','Pat',TO_DATE('2015-08-17'),6000);
INSERT INTO EMPLOYEES VALUES('10','Alexander',TO_DATE('2016-01-03'),3100);
INSERT INTO EMPLOYEES VALUES('20','Michael',TO_DATE('2014-02-17'),13000);
INSERT INTO EMPLOYEES VALUES('20','Kevin',TO_DATE('2016-01-24'),6000);
INSERT INTO EMPLOYEES VALUES('30','Den',TO_DATE('2012-12-07'),11000);
INSERT INTO EMPLOYEES VALUES('30','Shelli',TO_DATE('2015-07-24'),2900);
INSERT INTO EMPLOYEES VALUES('30','Sigal',TO_DATE('2015-12-24'),2800);

COMMIT;

SELECT * FROM EMPLOYEES;

-- 급여 누적값 계산
SELECT DEPARTMENT_ID,
	   NAME,
	   SALARY,
	   HIRE_DATE,
       SUM(SALARY) OVER(ORDER BY NAME) AS SAL_SUM
  FROM EMPLOYEES;

-- 부서별 급여 누적값 계산
SELECT DEPARTMENT_ID,
	   NAME,
	   SALARY,
	   HIRE_DATE,
       SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY HIRE_DATE) AS SAL_SUM
  FROM EMPLOYEES;
  
-- 부서별 급여 총계 및 평균 계산
SELECT DEPARTMENT_ID,
       COUNT(*) 사원수,
	   SUM(SALARY) 급여총계,
       ROUND(AVG(SALARY), -1) 급여평균
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
-- 부서별 급여 소계 및 총계 계산
SELECT DEPARTMENT_ID,
	   SUM(SALARY) 급여합계
  FROM EMPLOYEES
  GROUP BY ROLLUP(DEPARTMENT_ID);
  
-- 부서별 급여 소계 및 총계 계산
SELECT DEPARTMENT_ID,
	   SUM(SALARY) 급여합계
  FROM EMPLOYEES
  GROUP BY CUBE(DEPARTMENT_ID);
  
DROP TABLE EMPLOYEES;