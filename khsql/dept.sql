-- �μ� ���̺�(dept)
CREATE TABLE dept(
    deptid    NUMBER PRIMARY KEY,   -- �⺻Ű
    deptname  VARCHAR2(20) NOT NULL, -- NULL ����
    location  VARCHAR2(20) NOT NULL
);

-- �μ� �ڷ� �߰� --
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '������', '����');
INSERT INTO dept(deptid, deptname, location)
VALUES (20, '������', '��õ');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '��������', '����');

SELECT SUBSTR(deptname, 1, 2) AS ����
FROM dept;

SELECT SUBSTR(deptname, 1, LENGTH(deptname)-1) AS ����
FROM dept;