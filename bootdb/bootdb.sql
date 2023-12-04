
create database bootdb;

grant all privileges on bootdb.* to root@localhost with grant option;

show databases;

use bootdb;

show tables;

create table member(
	id varchar(10) primary key,
    passwd varchar(100),
    mname varchar(30),
    role varchar(12),
    enabled boolean
);

insert into member values ('member', 'member123', '회원', 'ROLE_MEMBER', true);
insert into member values ('manager', 'manager123', '매니저', 'ROLE_MANAGER', true);
insert into member values ('admin', 'admin123', '어드민', 'ROLE_ADMIN', true);

commit;

select * from board;
select * from member;

drop table member;








