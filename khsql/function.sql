
SELECT ABS(-10) FROM DUAL;

SELECT ROUND(327.56, 1) FROM DUAL;

SELECT ROUND(327, -1) FROM DUAL;

SELECT ROUND(327, -2) FROM DUAL;

SELECT TRUNC(327.56, -1) FROM DUAL;

SELECT custid, ROUND(AVG(saleprice), 2) AS ��ձݾ�
FROM orders
GROUP BY custid;

SELECT custid ����ȣ, COUNT(*) �ֹ���, SUM(saleprice) �Ѿ�
FROM orders
GROUP BY custid;

SELECT custid ����ȣ, ROUND(SUM(saleprice)/COUNT(*), -2) ��ձݾ�
FROM orders
GROUP BY custid;

-- salary�� 30�Ϸ� ���� �� �Ҽ� �ڸ����� ���� �ݿø��� �� ���
SELECT salary,
       salary/30 �ϱ�,
       ROUND(salary/30, 1) ���1,
       ROUND(salary/30, 0) ���2,
       ROUND(salary/30, -1) ���3
FROM emp;

-- salary�� 30�Ϸ� ���� �� �Ҽ� �ڸ����� ���� ����(����)�� ���
SELECT salary,
       salary/30 �ϱ�,
       TRUNC(salary/30, 1) ���1,
       TRUNC(salary/30, 0) ���2,
       TRUNC(salary/30, -1) ���3
FROM emp;

-- ���� Ÿ��
-- �ҹ��ڷ� �����ϱ�
SELECT LOWER('ABCD') RESULT FROM DUAL;

-- SUBSTR(����, �ε���, ���ڼ�) : ���ڼ� �����ϱ�
SELECT SUBSTR('ABC', 1, 2) RESULT FROM DUAL;

-- REPLACE(����, ��������, ���ο��) : ���� �����ϱ�
SELECT REPLACE('ABC', 'A', 'E') RESULT FROM DUAL;

-- CONCAT(����1, ����2) - ���� ����
SELECT CONCAT('A', 'B') RESULT FROM DUAL;

-- ���Ῥ���� - '||'
SELECT '�ȳ�' || '�ϼ���' RESULT FROM DUAL;

-- LPAD(����, ���ڼ�, ��ȣ) - ��ȣ�� ���ʺ��� ä��
-- RPAD(����, ���ڼ�, ��ȣ) - ��ȣ�� �����ʺ��� ä��
SELECT LPAD('cloud', 10, '*') RESULT FROM DUAL;
SELECT RPAD('cloud', 10, '*') RESULT FROM DUAL;

-- ���� ���� '�߱�'�� ���Ե� ������ '��'�� �����Ͽ� �˻�
SELECT bookid,
       REPLACE(bookname, '�߱�', '��') bookname
FROM BOOK;

-- �½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� �˻�
-- �ѱ� 3Byte, ����, Ư����ȣ - 1Byte
SELECT bookname,
       LENGTH(bookname)���ڼ�,
       LENGTHB(bookname) ����Ʈ��
FROM book
WHERE publisher = '�½�����';

-- �� �̸�(��)���� ���� ���� ���� ����� �ο����� ���Ͻÿ�
-- ��Ʈ, GROUP BY��, SUBSTR(), COUNT(*)
SELECT SUBSTR(name, 1, 1) ��, COUNT(*) �ο�
FROM customer
GROUP BY SUBSTR(name, 1, 1);

-- ��¥ �Լ�
-- ��¥ ���
SELECT SYSDATE FROM DUAL;

-- ��¥�� �ð�
SELECT SYSTIMESTAMP FROM DUAL;

-- 20������ ��¥ ���
SELECT SYSDATE - 20 FROM DUAL;

-- 3���� ���� ��¥ ���
SELECT ADD_MONTHS(SYSDATE, 3) ��� 
FROM DUAL;
-- 3���� ���� ��¥ ���
SELECT ADD_MONTHS(SYSDATE, -3) ��� 
FROM DUAL;

-- Ư���Ͽ��� 3���� ���� ��¥ ���
SELECT ADD_MONTHS('2023/04/01', -3) ��� 
FROM DUAL;

-- Ư���� ������ 10����(Ư���� ��: ������ -> ��¥��)
-- SELECT TO_DATE('2023/10/01') + 10 FROM DUAL;
SELECT TO_DATE('2023-10-01') + 10 ��� 
FROM DUAL;

-- �Ի��� : 2022-1-1, ����� : 2023-1-31(���� ���)
SELECT
    ROUND(MONTHS_BETWEEN(TO_DATE('2022-12-31'), 
            TO_DATE('2022-1-1')), 0) �Ѱ�����
FROM DUAL;

-- �ֹ���ȣ�� 6���� 10������ ������ �ֹ��Ͽ� 3������ ���Ѱ��� ���Ͻÿ�.
-- 1. �ֹ���ȣ�� 6~10�� ���� �˻�
-- 2. �ֹ��Ͽ� 3���� ���ϱ�, ����
SELECT orderid �ֹ���ȣ,
       ADD_MONTHS(orderdate, 3) ���ϱ���,
       ADD_MONTHS(orderdate, -3) ������
FROM orders
--WHERE orderid >=6 AND orderid <= 10;
WHERE orderid BETWEEN 6 AND 10;

-- �ֹ���ȣ�� 10�� ������ �ֹ��Ϸκ��� ���ñ����� �� �������� ���Ͻÿ�
-- MONTHS_BETWEEN(���ĳ�¥, ������¥)
SELECT orderid �ֹ���ȣ, 
       orderdate �ֹ���,
       TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) �Ѱ�����
FROM orders
WHERE orderid = 10;

-- ������ �ֹ��Ϸκ��� 10���� ������ Ȯ���Ѵ�. 
-- �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT orderid �ֹ���ȣ, 
       orderdate �ֹ���,
       TO_DATE(orderdate) + 10 Ȯ����
FROM orders;

-- �ڵ� Ÿ�� ��ȯ
SELECT 1 + '2' FROM DUAL;

-- ���� Ÿ�� ��ȯ
-- ���ڸ� ���� �������� ��ȯ
SELECT TO_NUMBER('120') ��� FROM DUAL;

-- ��¥ ����(������ ��¥ �������� ��µ�)
SELECT TO_DATE('2022-06-30') FROM DUAL;

-- ��¥ ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') ��¥,
       TO_CHAR(SYSDATE, 'YYYY') ����,
       TO_CHAR(SYSDATE, 'MM') ��,
       TO_CHAR(SYSDATE, 'DD') ��
FROM DUAL;

-- �ð� ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS AM') �ð�����,
       TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') ��¥�ͽð�
FROM DUAL;