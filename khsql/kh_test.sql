-- test join
CREATE TABLE T_DEPARTMENT(
    DEPTCODE NUMBER,
    DEPTNAME VARCHAR2(10)
);

CREATE TABLE T_EMPLOYEE(
    EMPNO NUMBER,
    EMPNAME VARCHAR2(10),
    DEPTNO NUMBER
);

INSERT INTO T_DEPARTMENT VALUES (10, '�λ��');
INSERT INTO T_DEPARTMENT VALUES (20, '�ѹ���');
INSERT INTO T_DEPARTMENT VALUES (30, '�����');

INSERT INTO T_EMPLOYEE VALUES (101, '���ϴ�', 10);
INSERT INTO T_EMPLOYEE VALUES (102, '�ڴ��', 20);
INSERT INTO T_EMPLOYEE VALUES (103, '�̰���', 20);

SELECT * FROM T_DEPARTMENT;
SELECT * FROM T_EMPLOYEE;

SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME
FROM T_EMPLOYEE INNER JOIN T_DEPARTMENT 
  ON (DEPTNO = DEPTCODE);
  
SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME
FROM T_EMPLOYEE RIGHT OUTER JOIN T_DEPARTMENT 
  ON (DEPTNO = DEPTCODE);
  
SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME
FROM T_EMPLOYEE, T_DEPARTMENT
WHERE DEPTNO(+) = DEPTCODE;

TRUNCATE TABLE T_DEPARTMENT;
TRUNCATE TABLE T_EMPLOYEE;