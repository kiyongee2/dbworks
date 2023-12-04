-- book ���̺� ����
CREATE TABLE book(
    bookid     NUMBER PRIMARY KEY,
    bookname   VARCHAR2(40) NOT NULL,
    publisher  VARCHAR2(40) NOT NULL,
    price      NUMBER NOT NULL
);

INSERT INTO book VALUES (1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES (2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES (3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES (4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES (5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES (6, '����� ����', '�½�����', 6000);
INSERT INTO book VALUES (7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES (8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book VALUES (9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Pearson', 13000);

COMMIT;

-- ������ �ְ�, ������ �˻�
SELECT MAX(price) AS �ְ���, MIN(price) AS �������� 
FROM book;

-- ���� ����
-- ���� ��� ������ �̸� �˻�
SELECT bookname, price
FROM book
 WHERE price = (SELECT MAX(price) FROM book);
 
-- ������ ������ ���� �ִ� ���� �̸� �˻�
SELECT name
FROM customer
  WHERE custid IN(SELECT custid FROM orders);
  
-- '������' ���� �ֹ� ���� �˻�
SELECT *
FROM orders
  WHERE custid IN(SELECT custid 
                    FROM customer 
                      WHERE name = '������');

DROP TABLE book;