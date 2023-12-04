
CREATE TABLE emp(
    -- 칼럼 이름  자료형
    empno   NUMBER(3) PRIMARY KEY,     -- 사원번호
    ename   VARCHAR2(20) NOT NULL,     -- 사원이름
    gender  VARCHAR2(6) NOT NULL,      -- 성별
    salary     NUMBER(10),             -- 급여
    hire_date  VARCHAR2(20) NOT NULL   -- 입사일
);

INSERT INTO emp VALUES (100, '이강', '남자', 3000000, '2019-01-01');
INSERT INTO emp VALUES (101, '김산', '여자', 2600000, '2020-05-15');
INSERT INTO emp VALUES (102, '오상식', '남자', 5000000, '2015-02-22');
INSERT INTO emp VALUES (103, '박신입', '여자', '',  '2023-10-01');
INSERT INTO emp VALUES (105, '우영우', '여자', 2600000, '2021-10-13');
INSERT INTO emp VALUES (103, '이신입', '남자', '2000000',  '2022-10-01');

SELECT * FROM emp;

-- 사원을 입사일 순으로 정렬하시오(오름차순)
SELECT * 
FROM emp
ORDER BY hire_date DESC;

-- 급여가 많은 순서로 정렬하시오
SELECT *
FROM emp
ORDER BY salary DESC;

-- 급여가 없는 사원을 검색하시오
SELECT * 
FROM emp
WHERE salary IS NULL;  -- null이 아닌 구문(is not null)

-- 급여가 300만원 이하인 사원을 급여가 많은 순서로 정렬하시오
SELECT *
FROM emp
WHERE salary <= 3000000
ORDER BY salary DESC;

-- 사원의 수를 구하시오
SELECT COUNT(*) as 사원수
FROM emp;

-- 사원의 급여의 합계와 평균을 구하시오
SELECT SUM(sal) 급여합계, AVG(sal) 급여평균
FROM emp;

-- 이름이 김산인 사원의 성별을 남자로 변경하시오
UPDATE emp 
SET gender = '남자'
WHERE ename = '김산';

-- 이름이 오상식인 사원을 삭제하시오.
DELETE FROM emp
WHERE ename = '박신입';

-- 급여가 가장 많은 사원과 가장 적은 사원 검색
SELECT ename, salary
FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp)
   OR salary = (SELECT MIN(salary) FROM emp);


SELECT * FROM emp;
DELETE FROM emp;

DROP TABLE emp;