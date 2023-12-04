-- ȸ�� ���̺�
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE DEFAULT SYSDATE
);

INSERT INTO t_member(memberid, passwd, name, gender) 
VALUES ('m12345', 'cloud', '����', '��');

-- �Խñ� ���̺�
CREATE TABLE t_board(
    bnum     NUMBER(4) PRIMARY KEY,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(2000) NOT NULL,
    regdate  TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit      NUMBER DEFAULT 0,
    memberid VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberid)
    REFERENCES t_member(memberid) ON DELETE CASCADE
);

-- �Խñ� ��ȣ ������ ����
--CREATE SEQUENCE b_seq;

-- �Խñ� ��ȣ ������ ��ü �ڵ�
CREATE SEQUENCE b_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

--���� ���ε� Į�� �߰�
ALTER TABLE t_board ADD fileupload VARCHAR2(50);

INSERT INTO t_board(bnum, title, content, memberid)
VALUES (b_seq.NEXTVAL, '�����Դϴ�.', '�� �����Դϴ�', 'ansan');

SELECT * FROM t_member;
SELECT * FROM t_board;

-- ����¡ ó��(ROWNUM�� 1�� �����ؾ���)
SELECT *
FROM (SELECT ROWNUM, t_board.* FROM t_board ORDER BY bnum DESC)
WHERE ROWNUM >= 1 AND ROWNUM <= 10;

-- ����¡ ó��1 (ROWNUM�� ��Ī ���- RN)
SELECT *
FROM (SELECT ROWNUM rn, t_board.* FROM t_board ORDER BY bnum DESC)
WHERE rn >= 11 AND rn <= 20;

-- ����¡ ó��2
SELECT *
FROM (SELECT ROWNUM rn, board.* 
            FROM(SELECT * FROM t_board ORDER BY bnum DESC) board)
WHERE rn >= 11 AND rn <= 20;

-- �Խñ� �� ��
SELECT COUNT(*) total FROM t_board; 

-- �ߺ� ID
SELECT DECODE(count(*), 1, 'true', 'false') AS result 
FROM t_member WHERE memberid='sunny';

-- �ߺ� ID
SELECT count(*) AS result 
FROM t_member WHERE memberid='cloud';

DROP TABLE t_member;
DROP TABLE t_board;

DROP SEQUENCE b_seq;