-- t_board 테이블 만들기 --
CREATE TABLE t_board(
    bnum NUMBER(4) PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    hit NUMBER(5),
    regDate DATE DEFAULT SYSDATE,
    memberId VARCHAR2(10),
    CONSTRAINT FK_MemberBoard FOREIGN KEY(memberId)
    REFERENCES t_member(memberId)
);

-- 시퀀스 생성 --
CREATE SEQUENCE b_seq
INCREMENT BY 1
START WITH 1 
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

-- 외래키 제약 조건 삭제
ALTER TABLE t_board DROP CONSTRAINT FK_MemberBoard;

-- 외래키 제약 조건 설정 : t_member의 자료 삭제 가능
ALTER TABLE t_board ADD CONSTRAINT FK_MemberBoard FOREIGN KEY(memberId)
REFERENCES t_member(memberId) ON DELETE CASCADE;

SELECT * FROM t_board;

DELETE FROM t_board WHERE bnum = 11;
COMMIT;

DROP SEQUENCE b_seq;

DROP TABLE t_board CASCADE CONSTRAINTS;
