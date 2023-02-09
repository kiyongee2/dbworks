-- 게시판 테이블 생성
CREATE TABLE tbl_board(
    bno  NUMBER(5),
    title VARCHAR2(200) NOT NULL,
    writer VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0,
    replycnt NUMBER DEFAULT 0
);
-- 기본키 제약 조건 이름 설정
ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY(bno);
--자동 순번
CREATE SEQUENCE seq; 

-- 댓글 테이블
CREATE TABLE tbl_reply(
    rno number(5),
    bno number(5) not null,
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replydate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);
-- 자동 순번
CREATE SEQUENCE seq_reply;
-- 기본키 설정
ALTER TABLE tbl_reply ADD CONSTRAINT pk_reply PRIMARY KEY(rno);
-- 외래키 설정
ALTER TABLE tbl_reply ADD CONSTRAINT fk_reply_board
FOREIGN key(bno) REFERENCES tbl_board(bno);

-- 댓글 개수 칼럼 추가
ALTER TABLE tbl_board ADD replycnt NUMBER DEFAULT 0;

-- 댓글 수 업데이트(이전에 작성된 댓글 개수)
UPDATE tbl_board
SET replycnt = 
    (
     SELECT COUNT(rno) FROM tbl_reply
     WHERE tbl_reply.bno = tbl_board.bno
    );

SELECT * FROM tbl_reply
ORDER BY rno DESC;

DROP TABLE tbl_board;
DROP TABLE tbl_reply;
DROP SEQUENCE seq;
DROP SEQUENCE seq_reply;

-- 더미 데이터(게시글) 입력
INSERT INTO tbl_board (bno, title, writer, content)
VALUES (seq.NEXTVAL, '테스트 제목', 'user00', '테스트 내용입니다.');

-- 더미 데이터(댓글) 입력
INSERT INTO tbl_reply(rno, bno, reply, replyer)
VALUES (seq_reply.NEXTVAL, 2, '태풍이 자주 오네요..', 'admin');

SELECT * FROM tbl_reply
WHERE bno = 2;

SELECT * FROM tbl_board ORDER BY bno DESC;

-- 재귀 복사
INSERT INTO tbl_board (bno, title, content, writer)
SELECT seq.nextval, title, content, writer from tbl_board;

-- 정렬하기(ROWNUM-오름차순, bno-내림차순)
-- bno는 게시글이 삭제된 경우 번호가 없어짐
-- ROWNUM은 실제 데이터는 아니지만, 실제의 데이터를 카운트하여 출력(VIEW)할 수 있음
SELECT ROWNUM, bno, title FROM tbl_board 
ORDER BY bno DESC;

-- 힌트(hint) 주기 - 인덱스 사용하여 정렬하기 : 기본키 사용 
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ ROWNUM, bno, title 
FROM tbl_board;

-- 1페이지 가져오기
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ ROWNUM bno, title 
FROM tbl_board 
WHERE ROWNUM <= 10;

-- 2페이지 가져올수 없음(0부터 시작해야 하므로)
SELECT /*+ INDEX_DESC(tbl_board pk_board) */ ROWNUM bno, title 
FROM tbl_board 
WHERE ROWNUM >10 AND ROWNUM <=20;

-- 서브쿼리(인라인 뷰) 사용:  11 ~ 20 뽑아내기
-- rownum이 키워드 이므로 rn 별칭 사용
SELECT * FROM
(
    SELECT /*+ INDEX(tbl_board pk_board) */
        ROWNUM rn, bno, title, writer, content 
    FROM tbl_board 
    WHERE ROWNUM <= 10
)
WHERE rn > 0;

-- 페이지 처리 SQL
SELECT * FROM
(
    SELECT /*+ INDEX_DESC(tbl_board pk_board) */
        rownum rn, bno, title, writer, content, regdate, updatedate, cnt
    FROM tbl_board 
    WHERE ROWNUM <= (2 * 10)
)
WHERE rn > (1-1) * 10;



