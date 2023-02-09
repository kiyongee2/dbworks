-- member 테이블 생성 --
CREATE TABLE member(
    memberid    VARCHAR2(5),
    passwd      VARCHAR2(8) NOT NULL,
    name        VARCHAR2(20) NOT NULL,
    age         NUMBER(3),
    regdate     DATE DEFAULT SYSDATE,
    PRIMARY KEY(memberid)
);

INSERT INTO member VALUES ('m1002', 'm1234567', '최민정', 21, SYSDATE);

SELECT * FROM member;

COMMIT;