-- DB 생성 및 권한 주기는 - system user에서.. 
create database homedb;
grant all privileges on homedb.* to root@localhost with grant option;

use homedb;
show tables;

select * from member order by reg_time desc;
select * from customer order by reg_time desc;