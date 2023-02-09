-- 회원 테이블
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joindate    DATE DEFAULT SYSDATE
);

-- 게시글 테이블
CREATE TABLE t_board(
    bnum     NUMBER(4) PRIMARY KEY,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(2000) NOT NULL,
    regdate  DATE DEFAULT SYSDATE,
    hit NUMBER(5) DEFAULT 0,
    memberId VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberId)
    REFERENCES t_member(memberId)
);
-- 게시글 번호 시퀀스 생성
CREATE SEQUENCE b_seq;

-- hit(추천수) 칼럼 추가
ALTER TABLE t_board ADD hit NUMBER;

-- 외래키 제약 조건 삭제
ALTER TABLE t_board DROP CONSTRAINT FK_MemberBoard;

-- 외래키 제약 조건 재설정
ALTER TABLE t_board ADD CONSTRAINT FK_MemberBoard FOREIGN KEY (memberId)
REFERENCES t_member(memberId) ON DELETE CASCADE;

INSERT INTO t_member VALUES ('cloud', 'm12345', '김기용', '남', SYSDATE);

INSERT INTO t_board VALUES (b_seq.NEXTVAL, '제목1.', '글 내용입니다', SYSDATE, 'cloud');

SELECT * FROM t_member;
SELECT * FROM t_board;

-- BNUM은 내림차순, ROWNUM은 오름차순
SELECT ROWNUM, board.*
FROM (SELECT * FROM t_board ORDER BY regdate DESC) board  -- 별칭 사용
--WHERE ROWNUM BETWEEN 6 AND 10;  --1부터 시작하지 않으면 검색 안됨
WHERE ROWNUM BETWEEN 1 AND 10;

-- 페이지 처리 SQL
SELECT * FROM(
    SELECT ROWNUM num, board.* 
    FROM (SELECT * FROM t_board ORDER BY bnum DESC) board
)
WHERE num BETWEEN 11 AND 20;  -- ROWNUM의 별칭 num을 만들면 검색됨

-- 중복 ID
SELECT DECODE(count(*), 1, 'true', 'false') AS result 
FROM t_member 
WHERE memberid='sunny';

SELECT COUNT(*) total FROM t_board; 

DELETE FROM t_board;

DROP TABLE t_board;
DROP SEQUENCE b_seq;

ROLLBACK;
