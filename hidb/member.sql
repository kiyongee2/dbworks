
-- 시퀀스 생성 
CREATE SEQUENCE mySeq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

-- 이 시퀀스는 1부터 시작해 1씩 증가하며 최소값 1부터 최댓값 1000까지
-- 순번을 자동 생성한다.
-- 이 시퀀스로 board 테이블에 사용

-- BOARD 테이블 생성
CREATE TABLE board(
    bno    NUMBER(4) PRIMARY KEY,
    title  VARCHAR2(50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regDate DATE DEFAULT SYSDATE
)

INSERT INTO board (bno, title, content, regDate) 
VALUES (mySeq.NEXTVAL, '제목1', '제목1 내용입니다.', SYSDATE);

INSERT INTO board (bno, title, content, regDate) 
VALUES (mySeq.NEXTVAL, '제목2', '제목2 내용입니다.', SYSDATE);

SELECT * FROM board;

-- 시퀀스 삭제
DROP SEQUENCE mySeq;

