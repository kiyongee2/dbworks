CREATE TABLE t_board (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate
);
CREATE SEQUENCE seq_bno NOCACHE;  -- 시퀀스: 일련번호

INSERT INTO t_board(bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, '가입 인사', '안녕하세요~ 만나서 반갑습니다.', 'today10');
INSERT INTO t_board(bno, btitle, bcontent, bwriter)
VALUES (seq_bno.NEXTVAL, '공지 사항', '천장 에어컨 청소합니다.', 'admin0000');

SELECT * FROM t_board ORDER BY bno DESC;

-- 재귀 복사
INSERT INTO t_board(bno, btitle, bwriter, bcontent)
(SELECT seq_bno.nextval, btitle, bwriter, bcontent FROM t_board);

-- ROWNUM을 이용한 페이지처리
SELECT ROWNUM, bno, btitle, bcontent, bwriter, bdate 
FROM t_board
WHERE ROWNUM > 0 AND ROWNUM <= 10
--WHERE ROWNUM >=11 AND ROWNUM <= 20;
ORDER BY bno DESC;

-- ROWNUM은 1을 포함해야하므로 rn을 사용하여 페이지 처리함
SELECT * 
  FROM (SELECT ROWNUM rn, bno, btitle, bcontent, bwriter, bdate
        FROM t_board 
        ORDER BY bno DESC)
WHERE rn > 10 AND rn <= 20;  -- 2페이지


DROP SEQUENCE seq_bno;
TRUNCATE TABLE t_board;