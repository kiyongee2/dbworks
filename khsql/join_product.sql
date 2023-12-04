-- product ���̺� ����
CREATE TABLE product(
    product_code  CHAR(6) PRIMARY KEY,   -- ��ǰ �ڵ�
    product_name  VARCHAR2(50) NOT NULL, -- ��ǰ��
    price        NUMBER NOT NULL         -- ����
);

INSERT INTO product VALUES ('100001', '������ ���� ���콺', 25000);
INSERT INTO product VALUES ('100002', '���� ���̹� Ű����', 30000);
INSERT INTO product VALUES ('100003', '������ �г� ���þ߰� �����', 120000);

-- product_review ���̺� ����
CREATE TABLE product_review(
    review_no     NUMBER PRIMARY KEY,     -- �����ȣ
    product_code  CHAR(6),                -- ��ǰ�ڵ�
    member_id     VARCHAR2(20) NOT NULL,  -- ȸ�����̵�
    content       CLOB NOT NULL,          -- ���䳻��
    regdate       DATE DEFAULT SYSDATE,   -- �����ۼ���
    FOREIGN KEY(product_code) REFERENCES product(product_code)
);
CREATE SEQUENCE seq_prod NOCYCLE; -- ���� �ڵ� ����
INSERT INTO product_review (review_no, product_code, member_id, content)
VALUES (seq_prod.NEXTVAL, '100001', 'today123', '�������ε� ������ ���� �ִ� ��');
INSERT INTO product_review (review_no, product_code, member_id, content)
VALUES (seq_prod.NEXTVAL, '100001', 'cloud100', '�����̶� ���� ���ϳ׿�');
INSERT INTO product_review (review_no, product_code, member_id, content)
VALUES (seq_prod.NEXTVAL, '100002', 'sky321', '������ �� ���ϴ�.');

-- event ���̺� ����
CREATE TABLE event(
    event_no    NUMBER PRIMARY KEY,     -- �̺�Ʈ ��ȣ
    event_name  VARCHAR2(30) NOT NULL,  -- �̺�Ʈ �̸�
    start_date  VARCHAR2(20) NOT NULL,  -- �̺�Ʈ ������
    end_date    VARCHAR2(20) NOT NULL   -- �̺�Ʈ ������
);
CREATE SEQUENCE seq_event NOCYCLE; -- �̺�Ʈ �ڵ� ����

INSERT INTO event (event_no, event_name, start_date, end_date)
VALUES (seq_event.NEXTVAL, '20% ���� ���� ����', '2023-10-10', '2023-10-20');
INSERT INTO event (event_no, event_name, start_date, end_date)
VALUES (seq_event.NEXTVAL, '���콺 �е� ����', '2023-11-15', '2023-11-10');
INSERT INTO event (event_no, event_name, start_date, end_date)
VALUES (seq_event.NEXTVAL, '���� ���� �佺Ƽ��', '2023-12-10', '2023-12-30');

SELECT * FROM product;
SELECT * FROM product_review;
SELECT * FROM event;

-- ���� ����(EQUI JOIN) �ǽ�
-- ��ǰ�� review�� �ִ� ��ǰ�ڵ�, ��ǰ��, ���並 �ۼ��� ȸ�����̵�, 
-- ���䳻��, ���� ������� ���
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ���� �˻� �����Ϳ��� ������ ���� ���콺 ���丸 ��� ���
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code
  AND a.product_code = '100001';
  
-- Non EQUI JOIN
-- �̺�Ʈ �Ⱓ ���� ���並 �ۼ��� ������ ����ǰ�� �ִ� ��縦 �ϰ� �ִٰ� ����
-- ���� ���̺�� �̺�Ʈ ���̺� ����
SELECT a.event_name,
       b.member_id,
       b.content,
       b.regdate
FROM event a, product_review b
WHERE b.regdate BETWEEN a.start_date AND a.end_date;

DROP TABLE product_review;
DROP SEQUENCE seq_prod;

-- ���並 ���� ��ǰ ���� �˻��ϱ�
-- 1. ��������
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 2. INNER JOIN ~ ON
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a INNER JOIN product_review b
   ON a.product_code = b.product_code;

-- ��� Į�� �˻�
SELECT a.*,
       b.*
FROM product a JOIN product_review b
   ON a.product_code = b.product_code;

-- JOIN ~ USING ���
-- ��, alias(��Ī)�� ����� �� ����
SELECT product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a JOIN product_review b
   USING (product_code);
   
-- ���並 ������ ���� ��ǰ�� �����Ͽ� ��� ��ǰ ���� �˻��ϱ�
-- 1. ��������
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code(+);

-- 2. LEFT OUTER JOIN
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a LEFT OUTER JOIN product_review b
   ON a.product_code = b.product_code;
   
-- 2. RIGHT OUTER JOIN
SELECT a.member_id,
       a.content,
       a.regdate,
       b.product_code,
       b.product_name
FROM product_review a RIGHT OUTER JOIN product b
   ON a.product_code = b.product_code;


TRUNCATE TABLE event;

