-- 게시판 테이블
CREATE TABLE board(
    bno        NUMBER PRIMARY KEY,
    title      VARCHAR2(100) NOT NULL,
    content    CLOB NOT NULL,
    createdate TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit        NUMBER DEFAULT 0,
    filename   VARCHAR2(50), 
    id         VARCHAR2(20) NOT NULL,
    replycnt   NUMBER DEFAULT 0,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE 
);

CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목', '글내용입니다.', 'khit');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목2', '글내용2입니다.', 'khit');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목3', '글내용3입니다.', 'today');
INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목4', '글내용4입니다.', 'today');

-- 재귀 복사
INSERT INTO board (bno, title, content, id)
(SELECT seq_bno.NEXTVAL, title, content, id FROM board);

-- 페이지 처리
SELECT ROWNUM, board.*
FROM board
WHERE ROWNUM > 0 AND ROWNUM <= 10;

-- 서브쿼리(검색이 불완전함)
SELECT *
FROM (SELECT ROWNUM RN, board.* FROM board ORDER BY bno DESC)
WHERE RN >= 21 AND RN <= 30;

-- 서브쿼리(deep 2단계- 주의! board 별칭을 bo를 사용함)
SELECT *
FROM (SELECT ROWNUM RN, bo.*
      FROM (SELECT * FROM board ORDER BY bno DESC) bo)
WHERE RN >= 11 AND RN <= 20;

-- 총 게시글 수
SELECT COUNT(*) AS total FROM board;

-- 게시글 검색(제목, 아이디)
SELECT *
FROM board
WHERE title LIKE '%2%';

-- 댓글
SELECT * FROM reply WHERE bno = 1;

-- 댓글 수 계산하기
UPDATE board
SET replycnt = (
            SELECT count(rno) 
            FROM reply
            WHERE bno = 2)
WHERE bno = 2;
    
-- 댓글 수 2
UPDATE board b
SET b.replycnt = (
            SELECT count(rno) 
            FROM reply
            WHERE reply.bno = board.bno
    );

SELECT count(rno) 
FROM reply
WHERE bno = 1;

DELETE FROM board;
DELETE FROM reply;

DROP TABLE board;
DROP SEQUENCE seq_bno;

