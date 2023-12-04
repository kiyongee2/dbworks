-- user 테이블 생성 : jdbc 테스트용
create table user(
	id	int primary key,
    pwd varchar(20) not null,
    name varchar(30) not null,
    phone varchar(20)
);

insert into user values(101, 'lightgreen', '김기용', '010-1234-5678');

select * from user;
