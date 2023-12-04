CREATE TABLE t_board (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate
);
CREATE SEQUENCE seq_bno NOCACHE;  -- ������: �Ϸù�ȣ

INSERT INTO t_board(bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, '���� �λ�', '�ȳ��ϼ���~ ������ �ݰ����ϴ�.', 'today10');
INSERT INTO t_board(bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, '���� ����', 'õ�� ������ û���մϴ�.', 'admin0000');

SELECT * FROM t_board ORDER BY bno DESC;

-- ��� ����
INSERT INTO t_board(bno, btitle, bwriter, bcontent)
(SELECT seq_bno.nextval, btitle, bwriter, bcontent FROM t_board);

-- ROWNUM�� �̿��� ������ó��
SELECT ROWNUM, bno, btitle, bcontent, bwriter, bdate 
FROM t_board
WHERE ROWNUM > 0 AND ROWNUM <= 10
--WHERE ROWNUM >=11 AND ROWNUM <= 20;
ORDER BY bno DESC;

-- ROWNUM�� 1�� �����ؾ��ϹǷ� rn�� ����Ͽ� ������ ó����
SELECT * 
  FROM (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate
        FROM t_board 
        ORDER BY bno DESC)
WHERE rn > 10 AND rn <= 20;  -- 2������


DROP SEQUENCE seq_bno;
TRUNCATE TABLE t_board;