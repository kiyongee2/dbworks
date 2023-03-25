-- board 테이블 생성
-- board 자동 순번
CREATE SEQUENCE seq_board;

CREATE TABLE board(
    bno  NUMBER(10, 0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);
-- pk 설정
ALTER TABLE board ADD CONSTRAINT pk_board2
PRIMARY KEY(bno);
-- replycnt 칼럼 추가
ALTER TABLE board ADD
replycnt NUMBER DEFAULT 0;

-- reply 테이블 생성
CREATE TABLE reply(
    rno NUMBER(10, 0),
    bno NUMBER(10, 0) NOT NULL,
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replyDate DATE DEFAULT SYSDATE,
    updateDate DATE DEFAULT SYSDATE
);
-- reply 자동 순번
CREATE SEQUENCE seq_reply;
-- reply pk 설정
ALTER TABLE reply ADD CONSTRAINT pk_reply2 
PRIMARY KEY (rno);
-- reply 외래키 설정
ALTER TABLE reply ADD CONSTRAINT fk_reply_board2 
FOREIGN KEY (bno) REFERENCES board(bno);

-- 기존 댓글 개수 업데이트
UPDATE board 
SET replycnt = 
    (
    SELECT COUNT(rno) FROM reply
    WHERE reply.bno = board.bno
    );

-- 더미 데이터 추가
INSERT INTO board(bno, title, content, writer) 
VALUES (seq_board.nextval, '테스트 제목', '테스트 내용입니다', 'user00');

-- 재귀 복사
INSERT INTO board(bno, title, content, writer)
(SELECT seq_board.nextval, title, content, writer FROM board);

-- FULL 힌트 : FULL SCAN
SELECT 
    /*+ FULL(board) */ ROWNUM rn, bno, title
FROM board
WHERE bno > 0;

-- INDEX를 이용 - 졍렬 생략
SELECT 
    /*+ INDEX_DESC(board pk_board2) */ 
    ROWNUM, bno, title, content
FROM board
WHERE bno > 0 AND ROWNUM <= 10; -- ROWNUM은 1을 포함해야 함

-- 인라인 뷰(서브 쿼리) : 10개씩 출력(페이지 처리)
SELECT *
FROM 
(
    SELECT 
        /*+ INDEX_DESC(board pk_board2) */ 
        ROWNUM rn, bno, title, content
    FROM board
    WHERE bno > 0 AND ROWNUM <= 20
)
WHERE rn > 10;

SELECT * FROM board WHERE ROWNUM < 10
ORDER BY bno DESC;

DELETE FROM board;
DROP TABLE board;
DROP SEQUENCE seq_board;

-- reply CRUD
INSERT INTO reply (rno, bno, reply, replyer)
VALUES (seq_reply.nextval, 2, '댓글 테스트', 'giyong');

SELECT * FROM reply ORDER BY rno DESC;

-- 집계 함수 : COUNT()
SELECT bno, COUNT(*)
FROM reply
GROUP BY bno
ORDER BY COUNT(*) DESC;

-- group by : rollup()
SELECT bno, reply, replyer, COUNT(*)
FROM reply
GROUP BY ROLLUP(bno, reply, replyer)
ORDER BY COUNT(*) DESC;

SELECT bno, reply, COUNT(*)
FROM reply
GROUP BY ROLLUP(bno, reply)
ORDER BY bno DESC;





