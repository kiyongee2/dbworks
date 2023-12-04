
SELECT LENGTH(column1) AS len1,
       LENGTH(column2) AS len2
  FROM ex2_1;

DESC ex2_5;
SELECT * FROM ex2_5;

-- ���Ἲ ���� ���� ���� --
INSERT INTO ex2_5(col_null, col_not_null) 
VALUES ('hello', '');

-- ex2_6 ����
CREATE TABLE ex2_6(
    id VARCHAR2(10) PRIMARY KEY,
    passwd VARCHAR2(10) NOT NULL
);

-- ���̺� �̸� ����
ALTER TABLE ex2_6 RENAME TO login;

-- Į�� �̸� ����
ALTER TABLE login RENAME COLUMN id TO userid;

-- �⺻Ű ���� 
INSERT INTO login(userid, passwd) 
VALUES ('sky123', 'u12345');

INSERT INTO login(userid, passwd) 
VALUES ('sky123', 'u98765');

-- Į�� �߰�
ALTER TABLE login ADD name VARCHAR2(10);

-- Į�� �ڷ��� ����
ALTER TABLE login MODIFY name VARCHAR2(20);

-- ���̺� ����
CREATE TABLE member AS
SELECT * FROM login;

SELECT * FROM login;



DROP TABLE ex2_3;