-- sqld function

SELECT salary,
       salary / 30 �ϱ�,
       ROUND(salary / 30, 1) ���1,
       ROUND(salary / 30, 0) ���2,
       ROUND(salary / 30, -1) ���3
FROM employee;

SELECT salary,
       salary / 30 �ϱ�,
       TRUNC(salary / 30, 1) ���1,
       TRUNC(salary / 30, 0) ���2,
       TRUNC(salary / 30, -1) ���3
FROM employee;

SELECT LOWER('ABCD') FROM DUAL;

SELECT SUBSTR('ABC', 1, 2) FROM DUAL;

SELECT REPLACE('ABC', 'A', 'E') FROM DUAL;

SELECT CONCAT('A', 'B') FROM DUAL;

SELECT 'A' || 'B' FROM DUAL;

SELECT LPAD('cloud', 10, '*') FROM DUAL;

SELECT RPAD('cloud', 10, '*') FROM DUAL;

SELECT SUBSTR(deptname, 1, 2) ����
FROM department;

SELECT empname,
       salary,
       RANK() OVER(ORDER BY salary DESC) �޿�_RANK,
       DENSE_RANK() OVER(ORDER BY salary DESC) �޿�_DENSE_RANK
FROM employee;

SELECT * FROM employee;

-- DECODE(Į��, ����, ��, ����)
SELECT empname,
        DECODE(gender, '����', 'M', 'F') gender
FROM employee;
/*
   CASE 
     WHEN ���� THEN ���1
     WHEN ���� THEN ���2
     ELSE ���3
   END
*/
SELECT empname,
       CASE
        WHEN gender = '����' THEN 'M'
        ELSE 'F'
       END AS gender
FROM employee;

SELECT empname, salary,
      CASE
        WHEN salary >= 3500000 THEN '����'
        WHEN salary >= 2500000 THEN '�븮'
        ELSE '���'
       END �޿�����
FROM employee;










