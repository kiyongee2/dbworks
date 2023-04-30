SELECT * FROM department;
SELECT * FROM employee;

DESC PLAN_TABLE;

-- �޿��� �ְ��� ����� ������ ����� �˻��Ͻÿ�
SELECT MAX(salary) �ְ�޿�, MIN(salary) �����޿�
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

SELECT * FROM board WHERE writer = '������';

-- INDEX ����
CREATE INDEX idx_admin ON board(writer);

-- INDEX ����
DROP INDEX idx_admin;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null, null, 'ALLSTATS LAST'));