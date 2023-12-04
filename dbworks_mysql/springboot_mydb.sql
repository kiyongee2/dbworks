
create user 'springboot'@'%' identified by 'springboot';

grant all privileges on *.* to 'springboot'@'%';

create database mydb;

use mydb;

select * from board order by create_date desc;
select * from member;
select * from reply;