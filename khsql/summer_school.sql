-- ����(����) �б� ���̺� ����
CREATE TABLE summer_class(
    sid   NUMBER,          -- �й�
    subject VARCHAR2(20),  -- ����
    price NUMBER           -- ������
);

INSERT INTO summer_class VALUES (100, 'C', 30000);
INSERT INTO summer_class VALUES (101, 'Java', 45000);
INSERT INTO summer_class VALUES (200, 'Python', 40000);
INSERT INTO summer_class VALUES (201, 'Java', 45000);

COMMIT;

SELECT * FROM summer_class;

-- �����б⸦ ��� �л��� �й��� �����ϴ� ������?
SELECT sid, subject 
FROM summer_class;

-- python ������ �������?
SELECT price 
FROM summer_class
WHERE subject = 'Python';

-- ���� �б⸦ ��� �л� ���� ������ �Ѿ���?
SELECT COUNT(*) �л���, 
       SUM(price) �������Ѿ�
FROM summer_class;

-- ���� �̻� --
-- 200�� �л��� ������û�� ����Ͽ� ����
DELETE FROM summer_class WHERE sid = 200;

-- -- python ������ ������� ��ȸ �ȵ�
SELECT price 
FROM summer_class
WHERE subject = 'Python';

-- ���� �̻� --
-- C++ ���� ����, ������� 40000 ���� ��û�� �л� ����
INSERT INTO summer_class VALUES (NULL, 'C++', 35000);

-- NULL���� �ִ� ��� Ʃ���� 5�������� �����л��� �� 4����
SELECT COUNT(*) �����ο�
FROM summer_class;

SELECT COUNT(sid) �����ο�
FROM summer_class;

SELECT COUNT(*) �����ο�
FROM summer_class
WHERE sid IS NOT NULL;

-- ���� �̻� --
-- Java ���� �����ᰡ 45,000������ 40,000������ ����Ǿ� ������
UPDATE summer_class
SET price = 40000
WHERE subject = 'Java';

SELECT * FROM summer_class;
-- ����
ROLLBACK;

-- ���� UPDATE���� ������ ���� �ۼ��ϸ� ������ ����ġ ���� �߻���
-- 1�Ǹ� ����
UPDATE summer_class
SET price = 40000
WHERE subject LIKE 'Java' AND sid = 101;

-- Java ������ ��ȸ
SELECT price Java������
FROM summer_class
WHERE subject LIKE 'Java';

-- ��ü ������ ���� : table�� ����
-- ROLLBACK ���� �ȵ�
TRUNCATE TABLE summer_class;

ROLLBACK;

drop table summer_class;
