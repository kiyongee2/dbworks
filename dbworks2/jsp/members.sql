-- member 테이블 생성 --
CREATE TABLE members(
    memberId    VARCHAR2(10) PRIMARY KEY,
    passwd      VARCHAR2(10) NOT NULL,
    name        VARCHAR2(20) NOT NULL,
    gender      VARCHAR2(5),
    joinDate    DATE DEFAULT SYSDATE
);

SELECT * FROM members;

INSERT INTO members VALUES ('a1001', '12345', '김기용', '남', SYSDATE);
COMMIT;

DROP TABLE members;