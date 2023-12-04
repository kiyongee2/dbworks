-- t_board ���̺�
CREATE TABLE t_board(
    bno NUMBER(5) PRIMARY KEY,            --�۹�ȣ
    btitle VARCHAR2(200) NOT NULL,         --������
    bwriter VARCHAR2(20) NOT NULL,         --�ۼ���
    content VARCHAR2(2000) NOT NULL,      --�۳���
    regdate DATE DEFAULT SYSDATE          --�����
);
CREATE SEQUENCE seq NOCACHE; -- �Ϸù�ȣ

INSERT INTO t_board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '�����λ�', '������', '�ȳ��ϼ���, �����λ� �����');
INSERT INTO t_board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '���������Դϴ�.', '������', '�����λ縦 �����ּ���');
INSERT INTO t_board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '�����λ��Դϴ�.', '�̰�', '�ȳ��ϼ���~');
INSERT INTO t_board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '���� �Ϸ�', '���Ϸ�', '���� �Ϸ� �Ǽ���');

-- ��õ�� Į���� �߰��Ͻÿ�(Į����: cnt, �ڷ���: NUMBER DEFAULT 0)
-- ALTER TABLE ���̺��̸� ADD Į���� �ڷ���
ALTER TABLE board ADD cnt NUMBER DEFAULT 0;

DESC board;

-- �ۼ��ڰ� �������� �Խñ��� �˻��Ͻÿ�
SELECT * FROM board 
WHERE bno = 2;

-- �Խñ��� �ۼ��ڸ� '������'���� 'admin'���� �����ϼ���.
-- UPDATE ���̺��̸� SET Į�� = ���氪 WHERE ��
UPDATE board SET writer = 'admin'
WHERE bno = 2;

-- 3�� �Խñ��� �����Ͻÿ�
-- DELETE FROM ���̺��̸� WHERE ��
DELETE FROM board 
WHERE bno = 3;

SELECT * FROM t_board ORDER BY bno DESC;

-- ��� ���� : INSERT INTO ���̺��̸� (SELECT ��)
INSERT INTO t_board(bno, title, writer, content)
(SELECT seq.nextval, title, writer, content FROM t_board);

-- ROWNUM ���
SELECT ROWNUM, bno, title, content
FROM t_board
WHERE ROWNUM > 0 AND ROWNUM <= 10
ORDER BY bno DESC;
--WHERE ROWNUM > 11 AND ROWNUM <= 10;  -- ROWNUM�� 1�� �����ؾ���

-- �ζ��� ��(���� ����) : 10���� ���(������ ó��)
SELECT * 
FROM
  (SELECT ROWNUM rn, bno, title, content, writer
    FROM t_board)
--WHERE ROWNUM > 11 AND ROWNUM <= 10;  
-- ROWNUM�� �� �� �������� ��Ī�� ����ؾ� �˻���
WHERE rn > 10 AND rn <= 20
ORDER BY bno DESC;

-- ROWID - �����͸� ������ �� �ִ� ������ ��, 
-- ������ ������ ���� ����� Ȯ���� �� ����
SELECT ROWID, bno, title
FROM t_board; 

SELECT bno, title, content
FROM t_board 
WHERE ROWID = 'AAAVQiAAHAAAAVEAAB';

-- ������ ����
DROP SEQUENCE seq;

-- ���̺� ����
DROP TABLE t_board;