-- SpringBoard1 프로젝트
-- t_user 테이블 생성
CREATE TABLE t_user(
    id  VARCHAR2(8) PRIMARY KEY,
    passwd VARCHAR2(8) NOT NULL,
    name  VARCHAR2(20) NOT NULL,
    role  VARCHAR2(5)
);

CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,
    title  VARCHAR2(200),
    writer  VARCHAR2(20),
    content  VARCHAR2(2000),
    regdate  DATE DEFAULT SYSDATE,
    cnt  NUMBER(5) DEFAULT 0
);
-- 시퀀스 : 자동 순번
CREATE SEQUENCE seq;

-- 회원 추가
INSERT INTO t_user VALUES ('admin', 'admin1234', '관리자', 'Admin');

-- 게시글 추가
INSERT INTO board(bno, title, writer, content)
VALUES (seq.NEXTVAL, '가입인사', '관리자', '잘 부탁드립니다...');

-- 페이징 처리
SELECT ROWNUM, board.* 
FROM board ORDER BY bno DESC;

-- BNO는 내림차순, ROWNUM은 오름차순
SELECT ROWNUM, board.*
FROM (SELECT * FROM board ORDER BY bno DESC) board
--WHERE ROWNUM BETWEEN 6 AND 10;  --1부터 시작하지 않으면 검색 안됨
WHERE ROWNUM BETWEEN 1 AND 10;

-- 페이지 처리 SQL
SELECT * FROM(
    SELECT ROWNUM num, bo.* 
    FROM (SELECT * FROM board ORDER BY bno DESC) bo -- 별칭 사용
)
WHERE num BETWEEN 6 AND 20;  -- ROWNUM의 별칭 num을 만들면 검색됨

-- SQL 사용
SELECT * FROM board ORDER BY bno DESC;
SELECT * FROM t_user;

DELETE FROM board WHERE bno=9 or bno=10;

DROP TABLE board;
DROP SEQUENCE seq;
