SELECT * FROM t_board;

ALTER TABLE t_board DROP COLUMN hit;

DELETE FROM t_board WHERE bnum > 10;
COMMIT;

-- INSERT INTO ~ SELECT ±¸¹®
INSERT INTO t_board(bnum, title, content, regDate, memberId)
SELECT bSeq.NEXTVAL, title, content, regDate, memberId 
FROM t_board;