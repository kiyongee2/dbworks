
use madang;
show tables;

create table summer(
	sid integer,
    class varchar(20),
    price integer
);

insert into summer values (100, 'FORTRAN', 20000);
insert into summer values (150, 'PASCAL', 15000);
insert into summer values (200, 'C', 10000);
insert into summer values (250, 'FORTRAN', 20000);

-- 계절학기를 듣는 학생의 학번과 수강하는 과목은 ?
select sid, class from summer;
-- C강좌의 수강료는?
select price from summer where class like 'c%';
-- 수강료가 가장 비싼 과목은?
select distinct class from summer
where price = (
		select max(price) 
        from summer
		);
-- 계절학기를 듣는 학생 수와 수강료 총액은 ?
select count(*) as 학생수, sum(price) as 수강료총액
from summer;

-- 삭제 이상 --
-- 200번 학생의 계절학기 수강 신청 취소
set sql_safe_updates=0; /* delete, update 연산에 필요한 설정*/

delete from summer
where sid = 200;

-- c강좌 수강료 조회
select price as c수강료
from summer where class like 'c';

-- 삽입 이상 --
-- 계절학기에 새로운 자바 강좌를 개설하시오
insert into summer values (NULL, 'JAVA', 25000);
-- 수강 인원 확인
select count(*) '수강인원' from summer;  /* 튜플 개수 - 5*/
select count(sid) '수강인원' from summer; /* 수강 학생 - 4*/

-- 수정 이상 --
-- FORTRAN 강좌의 수강료를 20000원에서 15000원으로 수정
update summer 
set price = 15000
where class = 'FORTRAN';
-- FORTRAN 강좌의 수강료를 15000원에서 20000원으로 복구 --
update summer 
set price = 20000
where class = 'FORTRAN';
-- 만약 UPDATE문을 다음과 같이 작성하면 데이터 불일치 문제 발생 --
update summer 
set price = 15000
where class = 'FORTRAN' and sid = 100;
-- 다음 실습을 위해 sid가 null인 투플 삭제 --
delete from summer where sid is null;

-- 수정된 계절학기 수강 테이블 --
drop table if exists SummerPrice;
drop table if exists SummerEnroll;




select * from summer;
drop table summer;



commit;
rollback;
