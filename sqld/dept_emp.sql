-- �μ� ���̺�
CREATE TABLE department(
    deptid      NUMBER,
    deptname    VARCHAR2(20) NOT NULL,
    location    VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid)
);

CREATE TABLE employee(
    empid      NUMBER PRIMARY KEY,
    empname    VARCHAR2(20) NOT NULL,
    age        NUMBER,
    salary     NUMBER,
    deptid      NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES department(deptid)  
);

-- employee ���̺��� gender Į�� �߰�
ALTER TABLE employee ADD gender VARCHAR2(10);

-- �μ� �ڷ� �߰�
INSERT INTO department VALUES (10, '������', '����');
INSERT INTO department VALUES (20, '�ѹ���', '��õ');

-- ��� �ڷ� �߰�
INSERT INTO employee VALUES (101, '�̰�', 27, 2500000, 10);
INSERT INTO employee VALUES (102, '���', 28, 2000000, 20);
INSERT INTO employee VALUES (103, '�ڴ��', 27, 3500000, 10);
INSERT INTO employee VALUES (104, '�ż���', 28, 1000000, 20);
INSERT INTO employee VALUES (105, '����', 28, 2000000, 20);
INSERT INTO employee VALUES (103, '����', 35, 3000000, 30); -- �μ��ڵ� ����
INSERT INTO employee VALUES (106, '���ϳ�', 38, 3000000, 20, '����');
INSERT INTO employee VALUES (107, '�Ѽ���', 47, 4500000, 20, '����');

-- INSERT INTO (SELECT ��)
INSERT INTO 

-- ��� �ڷ� ����
UPDATE employee SET gender = '����' WHERE empid = 101;
UPDATE employee SET gender = '����' WHERE empid = 102;
UPDATE employee SET gender = '����' WHERE empid = 103;
UPDATE employee SET gender = '����' WHERE empid = 105;

-- ��� �ڷ� ����
DELETE FROM employee WHERE empid = 106 OR empid = 107;

-- �μ� ����
DELETE FROM department WHERE deptid = 20; -- employee ���̺����� �����ϰ� �־� ����.

ALTER TABLE employee DROP CONSTRAINT EMP_FK;

SELECT * FROM employee;
SELECT * FROM department;

-- ���̺� ���� - CONSTRAINT�� �����Ǿ� �ִ� ���
DROP TABLE department CASCADE CONSTRAINTS;

DROP TABLE department;
DROP TABLE employee;

DELETE FROM employee;

DESC employee;



