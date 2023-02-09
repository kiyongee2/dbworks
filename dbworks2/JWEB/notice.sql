--NEWRECK 실습용 파일
--MEMBER 테이블
CREATE TABLE member(
    id VARCHAR2(50),
    pwd VARCHAR2(50),
    name VARCHAR2(50),
    gender VARCHAR2(50),
    age NUMBER,
    birthday VARCHAR2(50),
    phone VARCHAR2(50),
    regDate date
);

--NOTICE 테이블(jsp)
CREATE TABLE notice(
    id NUMBER,
    title VARCHAR2(100),
    writer_id VARCHAR2(50),
    content CLOB,
    regDate TIMESTAMP,
    hit NUMBER,
    files VARCHAR2(1000)
);

--NOTICE2 테이블(spring)
CREATE TABLE notice2(
    id NUMBER NOT NULL,
    title VARCHAR2(100) NOT NULL,
    writer_id VARCHAR2(50) NOT NULL,
    content CLOB,
    regDate TIMESTAMP(6) DEFAULT systimestamp NOT NULL,
    hit NUMBER DEFAULT 0 NOT NULL,
    files VARCHAR2(1000),
    pub NUMBER(1,0) DEFAULT 0 NOT NULL,
    CONSTRAINT "NOTICE_PK" PRIMARY KEY(id)
);

INSERT INTO notice VALUES (1, '글제목1', 'sky1', '글내용입니다1', SYSTIMESTAMP, 1, 'A');
INSERT INTO notice VALUES (2, '글제목2', 'sky2', '글내용입니다2', SYSTIMESTAMP, 6, 'A');
INSERT INTO notice VALUES (3, '글제목3', 'sky3', '글내용입니다3', SYSTIMESTAMP, 3, 'A');
INSERT INTO notice VALUES (4, '글제목4', 'sky4', '글내용입니다4', SYSTIMESTAMP, 1, 'A');
INSERT INTO notice VALUES (5, '글제목5', 'sky5', '글내용입니다5', SYSTIMESTAMP, 15, 'A');
INSERT INTO notice VALUES (6, '글제목6', 'sky6', '글내용입니다6', SYSTIMESTAMP, 4, 'A');
COMMIT;

SELECT * FROM NOTICE;

INSERT INTO notice 
SELECT * FROM notice;

COMMIT;