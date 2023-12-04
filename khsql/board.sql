CREATE TABLE board (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate
);
CREATE SEQUENCE seq_bno NOCACHE;  -- 시퀀스: 일련번호

INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '가입 인사', '안녕하세요~ 만나서 반갑습니다.', 'today10');
INSERT INTO board(bno, btitle, bcontent, bwriter)
VALUES (seq.NEXTVAL, '공지 사항', '천장 에어컨 청소합니다.', 'admin0000');


SELECT bno, btitle, bcontent, bwriter, bdate
FROM board;

UPDATE board
SET btitle = '삭제 제목',
    bwriter = '최은숙',
    bcontent = '삭제할 내용입니다.'
WHERE bno = 3;

DELETE FROM board WHERE bno = 3;

DROP TABLE board;
DROP SEQUENCE seq_bno;

TRUNCATE TABLE board;