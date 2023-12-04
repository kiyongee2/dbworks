-- NVL(�μ�1, �μ�2)
-- �μ�1�� NULL�� �ƴϸ� �μ�1 ���, NULL�̸� �μ�2 ���
SELECT ename,
       NVL(salary, 0) salary
FROM emp;

CREATE TABLE K1(
    ID  VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 10);

SELECT ID, CNT
FROM K1;

SELECT NVL(CNT, 0)
FROM K1;

SELECT COUNT(NVL(CNT, 0)) COUNT FROM K1; --5

SELECT SUM(NVL(CNT, 0))/4 SUM FROM K1;   --5

SELECT AVG(NVL(CNT, 0)) AVERAGE FROM K1; --4
-- NULL�� 5�� ����
SELECT NVL(CNT, 5)
FROM K1;

SELECT MIN(NVL(CNT, 5)) AVERAGE FROM K1; --5

-- DECODE(Į����, ����, ��, ����) �Լ� -IF �Լ��� ������
-- ���ǿ� Ư������ ����, ������ �� �� ����
-- Male, Female
SELECT ename,
       DECODE(gender, '����', 'M', 'F') gender,
       salary
FROM emp;

--CASE WHEN ����
/*
    CASE
        WHEN ���� THEN ���1
        WHEN ���� THEN ���2
        ELSE ���3
    END
*/
SELECT ename,
       CASE
         WHEN gender = '����' THEN 'M'
         ELSE 'F'
       END gender,
       salary
FROM emp;

-- �޿��� 350���� �̻��̸� ������ '����'�� ǥ���ϰ�,
-- 250���� �̻��̸� '�븮'�̰� �ƴϸ� '���'���� ǥ��
SELECT ename,
       salary,
       CASE
         WHEN salary >= 3500000  THEN '����'
         WHEN salary >= 2500000  THEN '�븮'
         ELSE '���'
       END �޿�����
FROM emp;

--RANK() �Լ�
SELECT ename,
       salary,
       RANK() OVER(ORDER BY salary DESC) �޿�_RANK,
       DENSE_RANK() OVER(ORDER BY salary DESC) �޿�_DENSE_RANK
FROM emp;




