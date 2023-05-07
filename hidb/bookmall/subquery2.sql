
SELECT * FROM book;

-- ������ ���� �Ǹž��� �˻��Ͻÿ�(���� �̸���, �Ǹž�)
-- �ζ��� ��
SELECT cs.name, SUM(saleprice) total
FROM (SELECT custid, name
        FROM customer) cs,
        orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- �� ��ȣ�� 2������ ������ ���� �Ǹž� �˻�
SELECT cs.name, SUM(saleprice) total
FROM (SELECT custid, name
        FROM customer
        WHERE custid <= 2) cs,
        orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- EQUI JOIN
SELECT cs.name, SUM(saleprice)
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- ��Į�� subquery
SELECT (SELECT name 
        FROM customer cs 
        WHERE cs.custid = od.custid) name, SUM(saleprice) total
FROM orders od
GROUP BY custid;

-- ��� ���� ���� �˻�
SELECT AVG(price) avg
FROM book;

-- ���ǻ纰 ��� ���� ���� �˻�
SELECT publisher, AVG(price) avg
FROM book
GROUP BY publisher;

-- ���ǻ纰 ��� ���� ���ݺ��� ��� ���� �˻�
SELECT b1.bookname, b1.publisher, b1.price
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
                    FROM book b2
                    WHERE b2.publisher = b1.publisher);













