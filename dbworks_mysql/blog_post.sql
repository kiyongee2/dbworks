create user 'bloguser'@'%' identified by 'bloguser';
grant all privileges on *.* to 'bloguser'@'%';
create database blog;

use blog;

insert into post(title, content) values ('제목1', '내용1');
insert into post(title, content) values ('제목2', '내용2');
commit;

select * from post;