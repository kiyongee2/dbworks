-- user 계정 생성

-- c##을 붙이지 않도록 설정
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- javauser 및 비밀번호 생성
CREATE USER javauser IDENTIFIED BY pwjavauser;

-- 권한 부여
GRANT CONNECT, RESOURCE, DBA TO javauser; 



