-- t_member 테이블 생성 --
CREATE TABLE t_member(
    id VARCHAR2(10) PRIMARY KEY,
    password VARCHAR2(10) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    email VARCHAR2(50),
    joinDate DATE DEFAULT SYSDATE
);

--회원 추가
INSERT INTO t_member (id, password, name, email) 
VALUES ('giyong', '1234', '김기용', 'kim@test.com');

COMMIT;

SELECT * FROM t_member;

DROP TABLE t_member;