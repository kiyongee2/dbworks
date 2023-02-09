
-- USER(jweb) 생성
CREATE USER C##jweb IDENTIFIED BY 54321;

-- 세션 권한 부여
GRANT CREATE SESSION TO C##jweb;

-- 테이블과 테이블 공간 생성
GRANT CREATE TABLE, RESOURCE TO C##jweb;

-- 테이블 스페이스 권한 주기
ALTER USER C##jweb DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- 권한 불충분 에러가 뜰 경우
-- sqlplus 접속후
-- GRANT CREATE ANY TABLE TO C##jweb;
-- GRANT CONNECT, RESOURCE, DBA TO C##jweb];

