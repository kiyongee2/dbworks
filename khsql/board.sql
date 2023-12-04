CREATE TABLE board (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate
);
CREATE SEQUENCE seq_bno NOCACHE;  -- ������: �Ϸù�ȣ

INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '���� �λ�', '�ȳ��ϼ���~ ������ �ݰ����ϴ�.', 'today10');
INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '���� ����', 'õ�� ������ û���մϴ�.', 'admin0000');


SELECT bno, btitle, bcontent, bwriter, bdate
FROM board;

UPDATE board
SET btitle = '���� ����',
    bwriter = '������',
    bcontent = '������ �����Դϴ�.'
WHERE bno = 3;

DELETE FROM board WHERE bno = 3;

DROP TABLE board;
DROP SEQUENCE seq_bno;

TRUNCATE TABLE board;