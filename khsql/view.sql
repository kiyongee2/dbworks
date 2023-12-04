-- �ּҿ� '���ѹα�'�� �����ϰ� �ִ� ������� ������ �� ����
CREATE VIEW vw_customer AS
SELECT * FROM customer
WHERE address LIKE '%���ѹα�%';
  
SELECT * FROM vw_customer;

SELECT * 
FROM vw_customer
WHERE address LIKE '%����%';

-- �� ����
DROP TABLE vw_customer;

-- Like�� '_'�� �� ���ڸ� �ǹ���
SELECT * 
FROM vw_customer
WHERE name LIKE '_��';

-- JOB_INFO ���̺�
CREATE TABLE JOB_INFO(
    JOB_ID  VARCHAR(10),
    MIN_SALARY  NUMBER,
    MAX_SALARY  NUMBER
);

INSERT INTO JOB_INFO VALUES ('AD_PRES', 20080, 40000);
INSERT INTO JOB_INFO VALUES ('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO VALUES ('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO VALUES ('FI_MGR', 8200, 16000);
INSERT INTO JOB_INFO VALUES ('FI_ACCOUNT', 4200, 9000);
INSERT INTO JOB_INFO VALUES ('AC_MGR', 8200, 16000);
INSERT INTO JOB_INFO VALUES ('AC_ACCOUNT', 4200, 9000);

COMMIT;
-- ���� �Լ� - COUNT(), SUM(), AVG()
SELECT COUNT(*) �Ѱ���, 
       ROUND(AVG(MIN_SALARY), -1) �����޿����,
       AVG(MAX_SALARY) �ִ�޿����
FROM JOB_INFO;

-- ���� �޿��� 5000 �޷� �̻��� ���� ���̵� �˻��Ͻÿ�
SELECT JOB_ID, MIN_SALARY "min_sal"
FROM JOB_INFO
WHERE MIN_SALARY > 5000;
--WHERE min_sal > 5000;  -- ��������� SELECT ���̹Ƿ� ��Ī ��� �Ұ�

/*�������
 1. FROM��
 2. WHERE ��
 3. SELECT ��
 4. ORDER BY
*/

-- ���� �޿��� 5000 �޷� �̻��� ���� ���̵� �˻��� �� ����
-- CREATE VIEW ���̸� AS ����
CREATE VIEW V_JOB_INFO 
AS SELECT *
   FROM JOB_INFO
   WHERE MIN_SALARY > 5000;
   
SELECT * FROM V_JOB_INFO;

-- �ְ��޿��� �����޿��� ���� 8000 �̻��� �������̵��� ���� �˻��Ͻÿ�
SELECT COUNT(*)
FROM V_JOB_INFO
WHERE MAX_SALARY - MIN_SALARY > 8000;

-- �ְ��޿��� �����޿��� ���� 8000 �̻��� �������̵� �˻��Ͻÿ�
SELECT JOB_ID
FROM V_JOB_INFO
WHERE MAX_SALARY - MIN_SALARY > 8000;

-- ���� ���̵��� �̸��� AD�� �����ϴ� �ڷḦ �˻��Ͻÿ�
SELECT JOB_ID
FROM V_JOB_INFO
WHERE JOB_ID LIKE 'AD%';

-- �� ����
DROP VIEW V_JOB_INFO;