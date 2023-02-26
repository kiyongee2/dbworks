-- Security 회원 테이블과 권한 테이블
CREATE TABLE tbl_member(
    userid  VARCHAR2(50) PRIMARY KEY,
    userpw  VARCHAR2(100) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    regdate  DATE DEFAULT SYSDATE,
    updatedate  DATE DEFAULT SYSDATE,
    enabled CHAR(1) DEFAULT '1'
);

-- 권한 테이블
CREATE TABLE tbl_member_auth(
    auth  VARCHAR2(50) NOT NULL,
    userid  VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY (userid)
    REFERENCES tbl_member(userid) ON DELETE CASCADE
);

-- 자동 로그인
CREATE TABLE persistent_logins(
    username  VARCHAR2(64) NOT NULL,
    series    VARCHAR2(64) PRIMARY KEY,
    token     VARCHAR2(64) NOT NULL,
    last_used TIMESTAMP NOT NULL
);

-- INNER JOIN : INNER 생략 가능
-- LEFT OUTER JOIN ~ ON ~ : OUTER 생략 가능
-- 회원의 상세 정보 출력
-- 인증 권한이 없는 회원도 출력
SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth
FROM tbl_member mem 
    LEFT OUTER JOIN tbl_member_auth auth 
    on mem.userid = auth.userid 
WHERE mem.userid = 'admin90'; 

SELECT mem.userid, mem.userpw, mem.username, mem.regdate, auth.auth
FROM tbl_member mem, tbl_member_auth auth
WHERE mem.userid = auth.userid;

-- 관리자로 등급 변경
UPDATE tbl_member_auth SET auth = 'ROLE_ADMIN' WHERE userid='admin';

SELECT * FROM tbl_member;
SELECT * FROM tbl_member_auth;
SELECT * FROM persistent_logins;

SELECT userid, userpw, enabled FROM tbl_member WHERE userid='admin99';
SELECT userid, auth FROM tbl_member_auth WHERE userid='admin99';

SELECT COUNT(*) 
FROM tbl_member
WHERE userid = 'cloud';

DELETE FROM tbl_member;
DELETE FROM tbl_member_auth;

DROP TABLE tbl_member;
DROP TABLE tbl_member_auth;

COMMIT;

