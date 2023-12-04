-- NVL(인수1, 인수2)
-- 인수1이 NULL이 아니면 인수1 출력, NULL이면 인수2 출력
SELECT ename,
       NVL(salary, 0) salary
FROM emp;

CREATE TABLE K1(
    ID  VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES('가', 5);
INSERT INTO K1 VALUES('나', NULL);
INSERT INTO K1 VALUES('다', 5);
INSERT INTO K1 VALUES('라', NULL);
INSERT INTO K1 VALUES('마', 10);

SELECT ID, CNT
FROM K1;

SELECT NVL(CNT, 0)
FROM K1;

SELECT COUNT(NVL(CNT, 0)) COUNT FROM K1; --5

SELECT SUM(NVL(CNT, 0))/4 SUM FROM K1;   --5

SELECT AVG(NVL(CNT, 0)) AVERAGE FROM K1; --4
-- NULL을 5로 변경
SELECT NVL(CNT, 5)
FROM K1;

SELECT MIN(NVL(CNT, 5)) AVERAGE FROM K1; --5

-- DECODE(칼럼명, 조건, 참, 거짓) 함수 -IF 함수와 유사함
-- 조건에 특정값이 오고, 범위는 올 수 없음
-- Male, Female
SELECT ename,
       DECODE(gender, '남자', 'M', 'F') gender,
       salary
FROM emp;

--CASE WHEN 구문
/*
    CASE
        WHEN 조건 THEN 결과1
        WHEN 조건 THEN 결과2
        ELSE 결과3
    END
*/
SELECT ename,
       CASE
         WHEN gender = '남자' THEN 'M'
         ELSE 'F'
       END gender,
       salary
FROM emp;

-- 급여가 350만원 이상이면 직급을 '과장'로 표시하고,
-- 250만원 이상이면 '대리'이고 아니면 '사원'으로 표시
SELECT ename,
       salary,
       CASE
         WHEN salary >= 3500000  THEN '과장'
         WHEN salary >= 2500000  THEN '대리'
         ELSE '사원'
       END 급여기준
FROM emp;

--RANK() 함수
SELECT ename,
       salary,
       RANK() OVER(ORDER BY salary DESC) 급여_RANK,
       DENSE_RANK() OVER(ORDER BY salary DESC) 급여_DENSE_RANK
FROM emp;




