
CREATE SEQUENCE seq_board;

CREATE TABLE board(
    bno  NUMBER(10, 0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);

ALTER TABLE board ADD CONSTRAINT pk_board2
PRIMARY KEY(bno);

INSERT INTO board(bno, title, content, writer) 
VALUES (seq_board.nextval, '테스트 제목', '테스트 내용입니다', 'user00');

SELECT * FROM board ORDER BY bno desc;