use javaweb;

-- member 테이블 생성
create table member(
	mid	varchar(20),
    passwd	varchar(20) not null,
    mname varchar(30) not null,
    gender varchar(10),
    birth varchar(20),
    phone varchar(20),
    email varchar(30) not null,
    address varchar(50),
    regdate timestamp default now(),
	primary key(mid)
);

insert into member(mid, passwd, mname, gender, birth, phone, email, address)
values('today', 'm123456#', '투데이', '남', '', '', 'cloud@sky.com', '');

select * from member order by regdate desc;

drop table member;