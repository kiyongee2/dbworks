-- member 테이블 생성 --
CREATE TABLE t_member(
    memberId    VARCHAR2(20),
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joinDate    DATE DEFAULT SYSDATE,
    PRIMARY KEY(memberId)
);

DROP TABLE t_member CASCADE CONSTRAINTS;

SELECT * FROM t_member;