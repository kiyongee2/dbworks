
-- user 및 비밀번호 설정
create user 'myuser'@'%' identified by 'pwmyuser';

-- user 계정에 모든 권한 부여
grant all privileges on *.* to 'myuser'@'%';

-- db 스키마 생성
create database mydb;