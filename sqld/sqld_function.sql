-- sqld function

SELECT salary,
       salary / 30 일급,
       ROUND(salary / 30, 1) 결과1,
       ROUND(salary / 30, 0) 결과2,
       ROUND(salary / 30, -1) 결과3
FROM employee;

SELECT salary,
       salary / 30 일급,
       TRUNC(salary / 30, 1) 결과1,
       TRUNC(salary / 30, 0) 결과2,
       TRUNC(salary / 30, -1) 결과3
FROM employee;

SELECT LOWER('ABCD') FROM DUAL;

SELECT SUBSTR('ABC', 1, 2) FROM DUAL;

SELECT REPLACE('ABC', 'A', 'E') FROM DUAL;

SELECT CONCAT('A', 'B') FROM DUAL;

SELECT 'A' || 'B' FROM DUAL;

SELECT LPAD('cloud', 10, '*') FROM DUAL;

SELECT RPAD('cloud', 10, '*') FROM DUAL;

SELECT SUBSTR(deptname, 1, 2) 팀명
FROM department;

SELECT empname,
       salary,
       RANK() OVER(ORDER BY salary DESC) 급여_RANK,
       DENSE_RANK() OVER(ORDER BY salary DESC) 급여_DENSE_RANK
FROM employee;









