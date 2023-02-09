-- board 테이블 생성
CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board(
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);

DROP TABLE tbl_board;

ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY(bno);

-- 더미 데이터 입력
INSERT INTO tbl_board (bno, title, content, writer)
VALUES (seq_board.NEXTVAL, '테스트 제목', '테스트 내용입니다.', 'user00');

SELECT * FROM tbl_board ORDER BY bno DESC;

-- 재귀 복사
INSERT INTO tbl_board (bno, title, content, writer)
(SELECT seq_board.nextval, title, content, writer from tbl_board);

-- 힌트(hint) 주기
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ rownum, bno, title FROM tbl_board WHERE bno > 0;

SELECT /*+ FULL(tbl_board pk_board) */ * FROM tbl_board WHERE bno > 0;

SELECT ROWNUM, bno, title FROM tbl_board;
SELECT * FROM tbl_board;

-- rownum이 키워드 이므로 rn 별칭 사용
-- 서브쿼리(인라인 뷰) :  11 ~ 20 뽑아내기
SELECT * FROM
(
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title 
FROM tbl_board 
WHERE bno > 0 AND ROWNUM > 0 AND ROWNUM <= 20
)
WHERE rn > 10;

-- 페이징 공식
SELECT * FROM
(
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title 
FROM tbl_board 
WHERE bno > 0 AND ROWNUM > 0 AND ROWNUM <= (2 * 10)
)
WHERE rn > (2-1) * 10;



