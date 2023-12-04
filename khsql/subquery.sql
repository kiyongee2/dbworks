-- subquery
-- ������ �������� : �˻� ����� �������� ��� IN ���
-- ������ ������ ���� �ִ� ���� �˻��Ͻÿ�
SELECT name
FROM customer
 WHERE custid IN (SELECT custid 
                    FROM orders);

-- ������ �������� : �˻� ����� �� ���� ��� '=' ���
-- ������ ���� �ֹ� ������ �˻��Ͻÿ�
SELECT *
FROM orders
 WHERE custid = (SELECT custid
                   FROM customer
                 WHERE name = '������');

-- subquery                 
-- '�̻�̵��'���� ������ ������ ������ ���� �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE custid IN (SELECT custid 
                  FROM orders
                WHERE bookid IN (SELECT bookid 
                                  FROM book
                                 WHERE publisher='�̻�̵��'));
                                 
-- join
SELECT DISTINCT cs.name
FROM book bk, customer cs, orders od
WHERE bk.bookid = od.bookid
  AND cs.custid = od.custid
  AND bk.publisher = '�̻�̵��';
              
-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ �˻��Ͻÿ�
-- Ʃ�� ���� - ���̺� �̸��� ��Ī
SELECT AVG(price) �������
FROM book;

SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
                    FROM book b2
                  WHERE b2.publisher = b1.publisher);
                         
-- �� ��ȣ�� 2������ ���� �̸��� ���� �Ǹž��� �˻��Ͻÿ�.
-- 1. ���� ������ ����� ���
SELECT cs.name, SUM(od.saleprice) AS total
FROM customer cs, orders od
WHERE cs.custid = od.custid
  AND cs.custid <= 2
GROUP BY cs.name;
--HAVING SUM(od.saleprice) >= 20000;

-- 2. subquery ��� : FROM��(�ζ��κ�)
SELECT cs.name, SUM(od.saleprice) total
FROM (SELECT * FROM customer 
        WHERE custid <= 2) cs,
      orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- ��Į�� ��������
-- ��ǰ ���� ���̺� ���� product_name ���
SELECT a.product_code,
       (SELECT b.product_name -- b.price
         FROM product b
        WHERE a.product_code = b.product_code) as product_name,
       a.member_id,
       a.content
FROM product_review a;
                 