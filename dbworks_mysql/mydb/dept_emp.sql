
use mydb;

create table department(
	deptid	int primary key,
    deptname  varchar(30) not null,
    location  varchar(20) not null
);

insert into department values(10, '개발팀', '서울');
insert into department values(20, '디자인팀', '인천');

create table employee(
	empid	int primary key,
    empname varchar(30) not null,
    age  int,
    sal  int,
    deptid int,
    foreign key(deptid) references department(deptid)
);
insert into employee values(101, '한강', 27, 2100000, 10);
insert into employee values(102, '백두산', 32, 3200000, 20);
insert into employee values(103, '오과장', 45, 5500000, 10);
insert into employee values(104, '김대리', 38, 4000000, 20);
-- 외래키 제약 조건 위배
insert into employee values(104, '홍길동', 25, 2000000, 30); 

select * from department;
select * from employee;
commit;

truncate table employee;