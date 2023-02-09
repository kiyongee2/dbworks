-- root에서 db 생성 및 권한
create database hilldb;

grant all privileges on hilldb.* to root@localhost with grant option;

show databases;
use hilldb;

show tables;

select * from member order by reg_time desc;
select * from board order by reg_time desc;