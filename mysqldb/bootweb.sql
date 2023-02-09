
-- user 생성
create user bootuser@localhost identified by 'boot';  
-- db 생성
create database bootweb;
-- db 권한 주기
grant all privileges on bootweb.* to bootuser@localhost with grant option;