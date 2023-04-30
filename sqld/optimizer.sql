SELECT * FROM department;
SELECT * FROM employee;

DESC PLAN_TABLE;

-- 급여가 최고인 사원과 최저인 사원을 검색하시오
SELECT MAX(salary) 최고급여, MIN(salary) 최저급여
FROM employee;

SELECT empname, salary
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee)
 OR salary = (SELECT MIN(salary) FROM employee);
 
--
SELECT b.empname,
       b.salary
FROM (
        SELECT a.empname, 
               a.salary,
               ROW_NUMBER() OVER(ORDER BY salary) minsal,
               ROW_NUMBER() OVER(ORDER BY salary DESC) maxsal
        FROM employee a
     ) b
WHERE b.minsal = 1 OR b.maxsal = 1;

SELECT * FROM board WHERE writer = '관리자';

-- INDEX 생성
CREATE INDEX idx_admin ON board(writer);

-- INDEX 삭제
DROP INDEX idx_admin;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));