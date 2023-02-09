-- DROP DATABASE IF EXISTS jweb;
-- DROP USER IF EXISTS jweb@localhost;

-- root에서 db 생성 및 권한
create database hilldb;

grant all privileges on hilldb.* to root@localhost with grant option;

-- user 생성
create user jweb@localhost identified by '54321';  
-- db 생성
create database javaweb;
-- db 권한 주기
grant all privileges on javaweb.* to jweb@localhost with grant option;

-- db 생성
create database springdb;
-- db 권한 주기
grant all privileges on springdb.* to jweb@localhost with grant option;



