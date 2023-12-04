-- 댓글 테이블 생성
CREATE TABLE reply(
    rno      NUMBER PRIMARY KEY,
    bno      NUMBER NOT NULL,
    rcontent VARCHAR2(2000) NOT NULL,
    replyer  VARCHAR2(20) NOT NULL,
    rdate    TIMESTAMP DEFAULT SYSTIMESTAMP,
    rupdate  TIMESTAMP,
    FOREIGN KEY(bno) REFERENCES board(bno)
);
CREATE SEQUENCE seq_rno NOCACHE;

INSERT INTO reply (rno, bno, rcontent, replyer)
VALUES (seq_rno.nextval, 1, '첫번째 댓글입니다.', 'today');

INSERT INTO reply (rno, bno, rcontent, replyer)
VALUES (seq_rno.nextval, 1, '두번째 댓글입니다. 반갑습니다..', 'cloud');

COMMIT;

SELECT * FROM reply;

SELECT * FROM reply WHERE bno = 1;

SELECT * FROM board ORDER BY bno;
DROP TABLE reply;
DROP SEQUENCE seq_rno;
