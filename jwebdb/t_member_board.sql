-- 회원 테이블
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE DEFAULT SYSDATE
);

INSERT INTO t_member(memberid, passwd, name, gender) 
VALUES ('m12345', 'cloud', '김기용', '남');

-- 게시글 테이블
CREATE TABLE t_board(
    bnum     NUMBER(4) PRIMARY KEY,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(2000) NOT NULL,
    regdate  TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit      NUMBER DEFAULT 0,
    memberid VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberid)
    REFERENCES t_member(memberid) ON DELETE CASCADE
);

-- 게시글 번호 시퀀스 생성
--CREATE SEQUENCE b_seq;

-- 게시글 번호 시퀀스 전체 코드
CREATE SEQUENCE b_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

--파일 업로드 칼럼 추가
ALTER TABLE t_board ADD fileupload VARCHAR2(50);

INSERT INTO t_board(bnum, title, content, memberid)
VALUES (b_seq.NEXTVAL, '제목입니다.', '글 내용입니다', 'ansan');

SELECT * FROM t_member;
SELECT * FROM t_board;

-- 페이징 처리(ROWNUM은 1을 포함해야함)
SELECT *
FROM (SELECT ROWNUM, t_board.* FROM t_board ORDER BY bnum DESC)
WHERE ROWNUM >= 1 AND ROWNUM <= 10;

-- 페이징 처리1 (ROWNUM은 별칭 사용- RN)
SELECT *
FROM (SELECT ROWNUM rn, t_board.* FROM t_board ORDER BY bnum DESC)
WHERE rn >= 11 AND rn <= 20;

-- 페이징 처리2
SELECT *
FROM (SELECT ROWNUM rn, board.* 
            FROM(SELECT * FROM t_board ORDER BY bnum DESC) board)
WHERE rn >= 11 AND rn <= 20;

-- 게시글 총 수
SELECT COUNT(*) total FROM t_board; 

-- 중복 ID
SELECT DECODE(count(*), 1, 'true', 'false') AS result 
FROM t_member WHERE memberid='sunny';

-- 중복 ID
SELECT count(*) AS result 
FROM t_member WHERE memberid='cloud';

DROP TABLE t_member;
DROP TABLE t_board;

DROP SEQUENCE b_seq;