
CREATE TABLE emp(
    -- Į�� �̸�  �ڷ���
    empno   NUMBER(3) PRIMARY KEY,     -- �����ȣ
    ename   VARCHAR2(20) NOT NULL,     -- ����̸�
    gender  VARCHAR2(6) NOT NULL,      -- ����
    salary     NUMBER(10),             -- �޿�
    hire_date  VARCHAR2(20) NOT NULL   -- �Ի���
);

INSERT INTO emp VALUES (100, '�̰�', '����', 3000000, '2019-01-01');
INSERT INTO emp VALUES (101, '���', '����', 2600000, '2020-05-15');
INSERT INTO emp VALUES (102, '�����', '����', 5000000, '2015-02-22');
INSERT INTO emp VALUES (103, '�ڽ���', '����', '',  '2023-10-01');
INSERT INTO emp VALUES (105, '�쿵��', '����', 2600000, '2021-10-13');
INSERT INTO emp VALUES (103, '�̽���', '����', '2000000',  '2022-10-01');

SELECT * FROM emp;

-- ����� �Ի��� ������ �����Ͻÿ�(��������)
SELECT * 
FROM emp
ORDER BY hire_date DESC;

-- �޿��� ���� ������ �����Ͻÿ�
SELECT *
FROM emp
ORDER BY salary DESC;

-- �޿��� ���� ����� �˻��Ͻÿ�
SELECT * 
FROM emp
WHERE salary IS NULL;  -- null�� �ƴ� ����(is not null)

-- �޿��� 300���� ������ ����� �޿��� ���� ������ �����Ͻÿ�
SELECT *
FROM emp
WHERE salary <= 3000000
ORDER BY salary DESC;

-- ����� ���� ���Ͻÿ�
SELECT COUNT(*) as �����
FROM emp;

-- ����� �޿��� �հ�� ����� ���Ͻÿ�
SELECT SUM(sal) �޿��հ�, AVG(sal) �޿����
FROM emp;

-- �̸��� ����� ����� ������ ���ڷ� �����Ͻÿ�
UPDATE emp 
SET gender = '����'
WHERE ename = '���';

-- �̸��� ������� ����� �����Ͻÿ�.
DELETE FROM emp
WHERE ename = '�ڽ���';

-- �޿��� ���� ���� ����� ���� ���� ��� �˻�
SELECT ename, salary
FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp)
   OR salary = (SELECT MIN(salary) FROM emp);


SELECT * FROM emp;
DELETE FROM emp;

DROP TABLE emp;