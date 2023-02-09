-- 인증/권한을 위한 테이블 설계
CREATE TABLE tbl_member(
    userid VARCHAR2(50) NOT NULL PRIMARY KEY,
    userpw VARCHAR2(100) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    regdate date DEFAULT SYSDATE,
    enabled CHAR(1) DEFAULT '1'
);

CREATE TABLE tbl_member_auth(
    userid VARCHAR2(50) NOT NULL,
    auth VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY(userid) REFERENCES
tbl_member(userid)
);

-- 로그인 정보 유지
CREATE TABLE persistent_logins(
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) PRIMARY KEY,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL
);

SELECT * FROM persistent_logins;

SELECT * FROM tbl_member;