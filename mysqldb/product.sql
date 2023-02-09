show databases;
use jspdb;
show tables;
select * from member;
select * from board;

desc member;
delete from member where id='member1';

drop table member;
drop table board;

insert into member 
values('cloud', 'm123456@', '구름이', '남', '1995-10-09', 'cloud@sky.com', '010-1234-5678', '서울시 은평구', '2022-08-15');

insert into board values (1, '제목입니다.', '글 내용입니다.', default, 0, 'cloud');
update member set mail='cloud@gmail.com' where id='cloud';

commit;