
use mydb;

-- java 연동 - board project
create table board(
	bno	int primary key auto_increment,
    btitle	varchar(100) not null,
    bcontent text not null,
    bwriter  varchar(20) not null,
    bdate timestamp default now()
);

insert into board(btitle, bcontent, bwriter) 
values ('제목', '내용입니다.', 'today20');

select * from board;

drop table board;