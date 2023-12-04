-- �� ���̺� ����
CREATE TABLE customer(
    custid      NUMBER PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    address     VARCHAR2(50),
    phone       VARCHAR2(20)
);

-- customer �ڷ� ����
INSERT INTO customer VALUES (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO customer VALUES (3, '�Ȼ�', '���ѹα� ���ֱ�����', '000-7000-0001');
INSERT INTO customer VALUES (4, '������', '�̱� �����', NULL);
INSERT INTO customer VALUES (5, '�����', '���� ��Ʈ��', '000-8000-0001');

COMMIT;

SELECT * FROM customer;

-- ��������
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
--  A INNER JOIN B ON ����
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid;

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��ϰ� 
-- ���� �̸��� ��������, �ǸŰ����� �������� �����Ͻÿ�.
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.name, orders.saleprice DESC;

SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
AND customer.name = '������';

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��ϰ�
-- ������ �ֹ����� ���� ���� �����Ͽ� �˻��Ͻÿ�
-- WHERE ��(+)
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid(+);

-- OUTER JOIN
--  A LEFT OUTER JOIN B ON ����
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid;

DROP TABLE customer;