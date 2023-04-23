-- bookmall 
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ���ѹα��� �����ϴ� ���� �̸� 
SELECT name 
FROM customer
WHERE address LIKE '%���ѹα�%';

-- ������ �ֹ��� ���� �̸��� �˻��Ͻÿ�(JOIN)
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- ������ �ֹ��� ���� �̸��� �˻��Ͻÿ�(SUBQUERY)
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- ���ѹα����� �����ϴ� ���� �̸��� ������ �ֹ��� ���� �̸� �˻�
-- UNION�� �ߺ��� �������� ����
SELECT name 
FROM customer
WHERE address LIKE '%���ѹα�%'
UNION
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- ���ѹα����� �����ϴ� ���� �̸��� ������ �ֹ��� ���� �̸� �˻�
-- UNION ALL�� �ߺ��� ������
SELECT name 
FROM customer
WHERE address LIKE '%���ѹα�%'
UNION ALL
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- ��������(EQUI JOIN)
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- ������ ���� �ֹ��� ������ �Ǹ� ������ �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
  AND cus.name = '������';
  
-- ������ ���� �ֹ��� ������ �� �Ǹűݾ��� �˻��Ͻÿ�
SELECT cus.name, SUM(saleprice) �Ǹűݾ�
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- ���� �̸��� �ֹ��� ���� �̸��� �Ǹ� ������ �˻��Ͻÿ�
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
  AND bk.bookid = ord.bookid
  ORDER BY cus.name;
  
-- ������ ���� �ֹ��� ���� �̸��� �Ǹ� ������ �˻��Ͻÿ�
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
  AND bk.bookid = ord.bookid
  AND cus.name = '������';

-- ǥ�� SQL ��� - ���� ����(INNER ~ JOIN ~ ON)
-- oracle�� �������ΰ� ������
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- oracle ���
-- WHERE ���� (+)���
-- ��� ���� ��µǴ� ���̺��� �ݴ��� ���̺� (+)�� �ٿ��ش�.
-- �ֹ��� ���� ���� �����Ͽ� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- LEFT OUTER JOIN ~ ON : JOIN ���ǿ� �����ϴ� �����Ͱ� �ƴϾ ����ϴ� ���
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- CROSS JOIN
-- ���� ���̺�� �� ���̺��� ����
-- ī�׽þ� �� (10 x 5 = 50)
SELECT *
FROM book 
CROSS JOIN customer;

-- ������ ���� �ֹ��� ���� �̸��� �Ǹ� ������ �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    WHERE cus.name = '������';