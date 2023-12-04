-- 부서별 급여 총액을 구하시오.
select deptid, 
       sum(sal) 급여총액,
       round(avg(sal), -2) 급여평균
from employee
group by deptid;

-- 부서이름을 포함한 사원의 모든 정보를 검색하시오(조인)
-- 동등조인
select a.deptid,
       a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
from department a, employee b
  where a.deptid = b.deptid;
-- 내부조인  
select a.deptid,
       a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
from department a join employee b
  on a.deptid = b.deptid;
-- join ~ using
select a.deptid,
       a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
from department a join employee b
  using (deptid);

-- 부서별, 부서이름별 급여 총액
select a.deptid,
       a.deptname,
       sum(b.sal) 급여총액,
       round(avg(b.sal), -2) 급여평균
from department a join employee b
  on a.deptid = b.deptid
group by deptid, deptname;

-- 부서별, 부서 이름별 급여 소계, 총계
select a.deptid,
       a.deptname,
       sum(b.sal) 급여총액,
       round(avg(b.sal), -2) 급여평균
from department a join employee b
  on a.deptid = b.deptid
group by deptid, deptname with rollup;

-- 최고 급여와 최저 급여를 받는 사원의 정보를 검색하시오
select *
from employee
where sal = (select max(sal) from employee)
  or sal = (select min(sal) from employee);
  
-- '백두산' 사원의 급여를 430만원으로 수정하세요.
update employee set sal = 4300000 
where empid = 102;  -- 기본키로만 변경이 가능함

select * from employee;
-- 사원의 급여 순위를 구하시오

select empname,
	   sal,
       rank() over(order by sal desc) 급여순위1,
       dense_rank() over(order by sal desc) 급여순위2
from employee;