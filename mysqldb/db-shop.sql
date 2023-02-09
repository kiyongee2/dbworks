show databases;
use shop;
show tables;

select * from member order by reg_time desc;
select * from board order by reg_time desc;
select * from item order by reg_time desc;
select * from item_img order by reg_time desc;
select * from orders order by reg_time desc;
select * from order_item order by reg_time desc;
select * from cart order by reg_time desc;
select * from cart_item order by reg_time desc;


-- shop 데이터 베이스 생성 --
create database shop default character set utf8 collate utf8_general_ci;

-- user 생성
create user jweb@localhost identified by '54321';

-- shopdb 생성
create database shopdb;

-- shopdb 권한 
grant all privileges on shopdb.* to jweb@localhost with grant option;
