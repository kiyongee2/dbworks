-- user: bootuser, springdb
create user 'bootuser'@'%' identified by 'bootuser';
grant all privileges on *.* to 'bootuser'@'%';
create database springdb;

use springdb;

show tables;
desc board;

insert into board(seq, title, content, writer)
values(1, '가입인사', '잘 부탁드립니다.', '김기용');

select * from board order by create_date desc;
select * from member;

delete from board where seq between 1 and 52;
delete from member where member_id = 'cloud';

drop table board;
drop table member;

desc member;