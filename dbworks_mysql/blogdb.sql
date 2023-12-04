-- user: bootuser, db: blogdb 만들기
create user 'bootuser'@'%' identified by 'bootuser';
grant all privileges on *.* to 'bloguser'@'%';
create database blogdb;

use blogdb;

select * from member;
select * from post order by create_date desc;
select * from reply;

-- 댓글 테스트
insert into reply(content, post_id, member_id, create_date)
values("첫번째 댓글", 2, 1, now());
insert into reply(content, post_id, member_id, create_date)
values("두번째 댓글", 2, 1, now());
insert into reply(content, post_id, member_id, create_date)
values("세번째 댓글", 2, 1, now());






