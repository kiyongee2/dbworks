
-- 게시판 테이블 생성 --
DROP TABLE board CASCADE CONSTRAINTS;

CREATE TABLE board(
    articleNO   NUMBER(10) PRIMARY KEY,
    parentNO    NUMBER(10) DEFAULT 0,
    title   VARCHAR2(500) NOT NULL,
    content VARCHAR2(4000),
    writeDate  DATE DEFAULT SYSDATE NOT NULL,
    id  VARCHAR2(10),
    CONSTRAINT FK_ID FOREIGN KEY(id)
    REFERENCES t_member(id)
);

SELECT * FROM board;

DELETE FROM board;
COMMIT;

-- 테스트 글 추가 --
INSERT INTO board(articleNO, parentNO, title, content, writeDate, id)
VALUES(1, 0, '테스트 제목', '테스트 글 내용입니다.', SYSDATE, 'hong');

INSERT INTO board(articleNO, parentNO, title, content, writeDate, id)
VALUES(2, 0, '안녕하세요', '상품 후기입니다.', SYSDATE, 'lee');

INSERT INTO board(articleNO, parentNO, title, content, writeDate, id)
VALUES(3, 2, '답변입니다.', '상품 후기에 대한 답변입니다.', SYSDATE, 'hong');

INSERT INTO board(articleNO, parentNO, title, content, writeDate, id)
VALUES(5, 3, '답변입니다.', '상품 좋아요~', SYSDATE, 'lee');

INSERT INTO board(articleNO, parentNO, title, content, writeDate, id)
VALUES(4, 0, '김유신입니다.', '김유신 테스트 글 내용입니다.', SYSDATE, 'kim');

INSERT INTO board(articleNO, parentNO, title, content, writeDate, id)
VALUES(6, 2, '상품 후기입니다.', '이순신 상품 후기입니다.', SYSDATE, 'lee');

-- 글 목록 조회 계층형 SQL문 --
SELECT LEVEL,
       articleNO,
       parentNO,
       LPAD(' ', 4*(LEVEL-1)) || title title,
       content,
       writeDate,
       id
       FROM board
       START WITH parentNO = 0
       CONNECT BY PRIOR articleNO = parentNO
       ORDER SIBLINGS BY articleNO DESC;








