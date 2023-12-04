-- �ֹ� ���̺� ����
CREATE TABLE orders(
    orderid     NUMBER PRIMARY KEY,
    custid      NUMBER NOT NULL,
    bookid      NUMBER NOT NULL,
    saleprice   NUMBER NOT NULL,
    orderdate   VARCHAR2(20) NOT NULL,
    FOREIGN KEY(custid) REFERENCES customer(custid),  --�ܷ�Ű(custid)
    FOREIGN KEY(bookid) REFERENCES book(bookid)       --�ܷ�Ű(bookid)
);

-- orders �ڷ� ����
INSERT INTO orders VALUES (1, 1, 1, 6000, '2018-07-01');
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-07-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2018-07-03');
INSERT INTO orders VALUES (4, 3, 6, 6000, '2018-07-04');
INSERT INTO orders VALUES (5, 4, 7, 20000, '2018-07-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2018-07-07');
INSERT INTO orders VALUES (7, 4, 8, 13000, '2018-07-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2018-07-08');
INSERT INTO orders VALUES (9, 2, 10, 7000, '2018-07-09');
INSERT INTO orders VALUES (10, 3, 8, 13000, '2018-07-10');

COMMIT;

SELECT * FROM orders;

SELECT COUNT(*) as ���ǸŰǼ�, 
       SUM(saleprice) ���Ǹž�, 
       AVG(saleprice) ��հ�
FROM orders;

-- �� ���̵� 2���� �ֹ��ݾ� �� ����� ���
SELECT SUM(saleprice) as �Ѹ���
FROM orders
WHERE custid = 2;

-- ���� �����̵�, �ֹ�����, �ֹ� �ѱݾ�
SELECT custid, COUNT(*) AS �ֹ�����, SUM(saleprice) AS �ֹ��ѱݾ�
FROM orders
GROUP BY custid;

SELECT custid, COUNT(*), SUM(saleprice)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >=2;

-- ���� �ֹ� ����
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ��� �˻�
SELECT cus.custid, cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- ������ �ֹ����� ���� ������ �����Ͽ� ���� �̸��� �ֹ� ������ �ǸŰ��� �˻�
SELECT cus.custid, cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+);

-- INNER JOIN ~ ON
SELECT cus.custid, cus.name, ord.saleprice
  FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid;
     
-- LEFT OUTER JOIN ~ ON
SELECT cus.custid, cus.name, ord.saleprice
  FROM customer cus LEFT OUTER JOIN orders ord
     ON cus.custid = ord.custid;

-- �����̵� �� �� �̸��� �ֹ� �ݾ� �˻�(�̸��� ����)
SELECT cus.custid, cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.custid, cus.name
ORDER BY cus.name;

-- ���� �̸��� �ֹ��� ������ �̸�, �ֹ���, �ֹ��ݾ� �˻�
SELECT customer.name, book.bookname, 
          orders.orderdate, orders.saleprice
FROM customer, book, orders
WHERE customer.custid = orders.custid
  AND book.bookid = orders.bookid;
