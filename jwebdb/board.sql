-- board 테이블 생성

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

-- 게시글 추가
INSERT INTO board(bno, title, writer, content)
VALUES (seq.NEXTVAL, '가입인사', '관리자', '잘 부탁드립니다...');

SELECT * FROM board ORDER BY bno DESC;
SELECT * FROM t_user;

DELETE FROM board WHERE bno=9 or bno=10;

DROP TABLE t_user;
DROP SEQUENCE seq;
