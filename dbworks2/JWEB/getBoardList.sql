-- getBoardList()
-- ROWNUM을 왜 쓰는가? 순번(bnum)은 게시글이 삭제되므로 레코드수 계산이 부정확함
SELECT * FROM t_board ORDER BY regDate DESC;

SELECT ROWNUM, t_board.* FROM t_board;

SELECT ROWNUM, t_board.* FROM t_board ORDER BY regDate DESC;

SELECT ROWNUM, board.*       -- t_board로 중복 검색이 되어 오류 - 새로운 별칭을 붙여줌
FROM (SELECT * FROM t_board ORDER BY regDate DESC) board
WHERE ROWNUM BETWEEN 1 AND 10;
--WHERE ROWNUM BETWEEN 6 AND 10;   -- ROWNUM은 1번부터 시작하지 않으면 검색 안됨.

-- paging 처리 적용 쿼리
SELECT * FROM (
    SELECT ROWNUM num, board.*    -- ROWNUM이 SELECT 바깥에서 또 검색되므로 오류 - 별칭을 붙여줌
    FROM (SELECT * FROM t_board ORDER BY regDate DESC) board
)
WHERE num BETWEEN 6 AND 10;

SELECT * FROM t_board;

DELETE FROM t_board 
WHERE BNUM > 29;

-- INSERT INTO ~ SELECT 구문
INSERT INTO t_board(bnum, title, content, regDate, hit, memberId)
SELECT bSeq.NEXTVAL, title, content, regDate, hit, memberId 
FROM t_board;

COMMIT;
