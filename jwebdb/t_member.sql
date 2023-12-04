-- ȸ�� ���̺�
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE DEFAULT SYSDATE
);

INSERT INTO t_member(memberId, passwd, name, gender) 
VALUES ('m12345', 'cloud', '����', '��');

-- �Խñ� ���̺�
CREATE TABLE t_board(
    bnum     NUMBER(4) PRIMARY KEY,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(2000) NOT NULL,
    regdate  DATE DEFAULT SYSDATE,
    hit      NUMBER DEFAULT 0,
    memberid VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberid)
    REFERENCES t_member(memberid)
);


-- �Խñ� ��ȣ ������ ����
CREATE SEQUENCE b_seq;


INSERT INTO t_board (bnum, title, content, memberid)
VALUES (b_seq.NEXTVAL, '�����Դϴ�.', '�� �����Դϴ�', 'ansan');

SELECT * FROM t_member;

SELECT * FROM t_board;

DROP TABLE t_board;
DROP SEQUENCE b_seq;