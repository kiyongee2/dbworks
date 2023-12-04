-- 주소에 '대한민국'을 포함하고 있는 고객들로 구성된 뷰 생성
CREATE VIEW vw_customer AS
SELECT * FROM customer
WHERE address LIKE '%대한민국%';
  
SELECT * FROM vw_customer;

SELECT * 
FROM vw_customer
WHERE address LIKE '%광주%';

-- 뷰 삭제
DROP TABLE vw_customer;

-- Like의 '_'은 한 글자를 의미함
SELECT * 
FROM vw_customer
WHERE name LIKE '_산';

-- JOB_INFO 테이블
CREATE TABLE JOB_INFO(
    JOB_ID  VARCHAR(10),
    MIN_SALARY  NUMBER,
    MAX_SALARY  NUMBER
);

INSERT INTO JOB_INFO VALUES ('AD_PRES', 20080, 40000);
INSERT INTO JOB_INFO VALUES ('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO VALUES ('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO VALUES ('FI_MGR', 8200, 16000);
INSERT INTO JOB_INFO VALUES ('FI_ACCOUNT', 4200, 9000);
INSERT INTO JOB_INFO VALUES ('AC_MGR', 8200, 16000);
INSERT INTO JOB_INFO VALUES ('AC_ACCOUNT', 4200, 9000);

COMMIT;
-- 집계 함수 - COUNT(), SUM(), AVG()
SELECT COUNT(*) 총개수, 
       ROUND(AVG(MIN_SALARY), -1) 최저급여평균,
       AVG(MAX_SALARY) 최대급여평균
FROM JOB_INFO;

-- 최저 급여가 5000 달러 이상인 직업 아이디를 검색하시오
SELECT JOB_ID, MIN_SALARY "min_sal"
FROM JOB_INFO
WHERE MIN_SALARY > 5000;
--WHERE min_sal > 5000;  -- 실행순서가 SELECT 전이므로 별칭 사용 불가

/*실행순서
 1. FROM절
 2. WHERE 절
 3. SELECT 절
 4. ORDER BY
*/

-- 최저 급여가 5000 달러 이상인 직업 아이디를 검색한 뷰 생성
-- CREATE VIEW 뷰이름 AS 구문
CREATE VIEW V_JOB_INFO 
AS SELECT *
   FROM JOB_INFO
   WHERE MIN_SALARY > 5000;
   
SELECT * FROM V_JOB_INFO;

-- 최고급여와 최저급여의 차가 8000 이상인 직업아이디의 수를 검색하시오
SELECT COUNT(*)
FROM V_JOB_INFO
WHERE MAX_SALARY - MIN_SALARY > 8000;

-- 최고급여와 최저급여의 차가 8000 이상인 직업아이디를 검색하시오
SELECT JOB_ID
FROM V_JOB_INFO
WHERE MAX_SALARY - MIN_SALARY > 8000;

-- 직업 아이디의 이름이 AD로 시작하는 자료를 검색하시오
SELECT JOB_ID
FROM V_JOB_INFO
WHERE JOB_ID LIKE 'AD%';

-- 뷰 삭제
DROP VIEW V_JOB_INFO;