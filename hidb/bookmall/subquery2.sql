
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

