CREATE TABLE JOB_INFO(
	JOB_ID		VARCHAR(10),
	MIN_SALARY	NUMBER,
	MAX_SALARY	NUMBER
);

INSERT INTO JOB_INFO VALUES('AD_PRES',20080,40000);
INSERT INTO JOB_INFO VALUES('AD_VP',15000,30000);
INSERT INTO JOB_INFO VALUES('AD_ASST',3000,6000);
INSERT INTO JOB_INFO VALUES('FI_MGR',8200,16000);
INSERT INTO JOB_INFO VALUES('FI_ACCOUNT',4200,9000);
INSERT INTO JOB_INFO VALUES('AC_MGR',8200,16000);
INSERT INTO JOB_INFO VALUES('AC_ACCOUNT',4200,9000);

COMMIT;

-- 뷰 만들기
CREATE VIEW V_JOB_INFO
AS
SELECT * FROM JOB_INFO WHERE MIN_SALARY > 5000;

-- 뷰 검색
SELECT * FROM V_JOB_INFO V_JOB_INFO;

SELECT COUNT(*) 
  FROM V_JOB_INFO
 WHERE MAX_SALARY - MIN_SALARY > 8000;

-- vw_EMP 검색
SELECT * FROM vw_EMP;

SELECT * FROM employee;

SELECT * FROM department;

-- 사원의 모든 정보와 부서이름을 검색하시오.
SELECT emp.*, dept.deptname
FROM employee emp, department dept
WHERE emp.deptid = dept.deptid;

-- 사원의 이름과 성별, 급여, 부서이름을 검색한 뷰를 작성하시오
CREATE VIEW vw_employee AS
SELECT emp.empname, emp.gender, emp.salary, dept.deptname
FROM employee emp, department dept
WHERE emp.deptid = dept.deptid;

SELECT * FROM vw_employee;

-- 사원의 총사원수를 구하시오
SELECT COUNT(*) 총사원수
FROM vw_employee;

-- 부서별 인원수를 구하시오
-- 총원이 3명을 초과하는 부서를 검색하시오
SELECT deptname, COUNT(*) total
FROM vw_employee
GROUP BY deptname
HAVING COUNT(*) > 3;

-- 부서별, 성별 인원수를 구하시오
SELECT deptname, gender, COUNT(*) total
FROM vw_employee
GROUP BY deptname, gender;

-- 부서별 성별 인원수의 소계 및 총계를 구하시오
SELECT deptname, gender, COUNT(*) total
FROM vw_employee
GROUP BY ROLLUP(deptname, gender);






