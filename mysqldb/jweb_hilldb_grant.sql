-- DB 생성 및 권한 주기는 - system user에서.. 
create database hilldb;
grant all privileges on hilldb.* to jweb@localhost with grant option;

