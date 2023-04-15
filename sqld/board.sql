-- board 테이블
CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,            --글번호
    title VARCHAR2(200) NOT NULL,         --글제목
    writer VARCHAR2(20) NOT NULL,         --작성자
    content VARCHAR2(2000) NOT NULL,      --글내용
    regdate DATE DEFAULT SYSDATE --등록일
);
-- 시퀀스(일련번호, 자동순번)
CREATE SEQUENCE seq;

-- 게시글 추가
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '가입인사', '강남역', '안녕하세요, 가입인사 드려요');
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '공지사항입니다.', '관리자', '가입인사를 남겨주세요');
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '가입인사입니다.', '이강', '안녕하세요~');
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '좋은 하루', '긴하루', '좋은 하루 되세요');

-- 추천수 칼럼을 추가하시오(칼럼명: cnt, 자료형: NUMBER DEFAULT 0)
-- ALTER TABLE 테이블이름 ADD 칼럼명 자료형
ALTER TABLE board ADD cnt NUMBER DEFAULT 0;

DESC board;

-- 작성자가 관리자인 게시글을 검색하시오
SELECT * FROM board 
WHERE bno = 2;

-- 게시글의 작성자를 '관리자'에서 'admin'으로 변경하세요.
-- UPDATE 테이블이름 SET 칼럼 = 변경값 WHERE 절
UPDATE board SET writer = 'admin'
WHERE bno = 2;

-- 3번 게시글을 삭제하시오
-- DELETE FROM 테이블이름 WHERE 절
DELETE FROM board 
WHERE bno = 3;

SELECT * FROM board;

-- 재귀 복사 - INSERT INTO 테이블이름 (SELECT 절)
INSERT INTO board(bno, title, writer, content)
(SELECT seq.nextval, title, writer, content FROM board);

-- ROWNUM 사용
SELECT ROWNUM, bno, title, content
FROM board
--WHERE ROWNUM > 0 AND ROWNUM <= 10;  
WHERE ROWNUM > 11 AND ROWNUM <= 10;  -- ROWNUM은 1을 포함해야함

-- 인라인 뷰(서브 쿼리) : 10개씩 출력(페이지 처리)
SELECT * 
FROM
  (SELECT ROWNUM rn, bno, title, content
    FROM board)
--WHERE ROWNUM > 11 AND ROWNUM <= 10;  
WHERE rn >= 11 AND rn <= 20; -- 별칭을 사용해야 검색됨

-- ROWID - 데이터를 구분할 수 있는 유일한값, 데이터 파일의 저장 블록을 확인할 수 있음
SELECT ROWID, bno, title
FROM board; 

SELECT bno, title, content
FROM board 
WHERE ROWID = 'AAAUkGAAHAAAH8eAAA';

-- 시퀀스 삭제
DROP SEQUENCE seq;

-- 테이블 삭제
DROP TABLE board;