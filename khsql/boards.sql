CREATE TABLE boards (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate,
    bfilename       varchar2(50)    null,
    bfiledata		blob			null
);
CREATE SEQUENCE SEQ_BNO NOCACHE;  -- ������: �Ϸù�ȣ

INSERT INTO boards(bno, btitle, bcontent, bwriter)
VALUES(SEQ_BNO.NEXTVAL, 'smartphone', '�Ｚ ������ S21�Դϴ�.', 'today');
INSERT INTO boards(bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata)
VALUES(SEQ_BNO.NEXTVAL, 'smartphone', '�Ｚ ������ S21�Դϴ�.', 'today', SYSDATE, null, null);
COMMIT;

SELECT * FROM boards;
SELECT bno, btitle, bcontent, bwriter, bdate, bfilename, bfiledata 
FROM boards WHERE bwriter = 'today';

--UPDATE boards SET
    --btitle = 'notebook';
    
--ROLLBACK;

UPDATE boards SET
    btitle = 'notebook1',
    bcontent = 'LG �׷�1',
    bwriter = 'cloud',
    bfilename = null,
    bfiledata = null
WHERE bno = 3;

COMMIT;

DELETE FROM boards;
--WHERE bwriter = 'cloud';

ROLLBACK;

DROP TABLE boards;
DROP SEQUENCE SEQ_BNO;


