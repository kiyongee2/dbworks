-- summer_price, summer_register ���̺� ����
CREATE TABLE summer_price(
    subject VARCHAR2(20),
    price   NUMBER
);

INSERT INTO summer_price VALUES ('C', 30000);
INSERT INTO summer_price VALUES ('Java', 45000);
INSERT INTO summer_price VALUES ('Python', 40000);

CREATE TABLE summer_register(
    sid     NUMBER,
    subject VARCHAR2(20)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'Java');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'Java');

SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- ���� �б⸦ ��� �л��� �й��� �����ϴ� ������?
SELECT sid, subject 
FROM summer_register;

-- Python ������ �������?
SELECT price
FROM summer_price
WHERE subject = 'Python';

-- �����ᰡ ���� ��� ������?
SELECT subject
FROM summer_price
WHERE price = (SELECT MAX(price) FROM summer_price);

-- �����б⸦ ��� �� �л����� ������ �Ѿ���?
SELECT COUNT(*) ���л���, SUM(price) �������Ѿ�
FROM summer_price;

-- ���� �̻� ����
-- 200�� �л��� ���� ��û�� ����Ͻÿ�
DELETE FROM summer_register 
WHERE sid = 200;

-- Python ������ �������?
SELECT price Python������
FROM summer_price
WHERE subject = 'Python';

-- �����̻� ����
-- C++ ���¿� ������ 35,000�� ����
INSERT INTO summer_price VALUES ('C++', 35000);

-- ���� ��û ���� Ȯ��
SELECT * FROM summer_price;

-- �����̻� ����
-- Java ������ �����Ḧ 45,000������ 40,000������ ����
UPDATE summer_price
SET price = 40000
WHERE subject = 'Java';

SELECT price Java������
FROM summer_price
WHERE subject = 'Java';


DROP TABLE summer_price;