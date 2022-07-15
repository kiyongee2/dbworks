-- 내장 함수 - 함수이름(매개변수)
-- 숫자 관련 함수
-- dual은 오라클에서 사용하는 가상 테이블임
-- 절대값 구하기
SELECT ABS(-10) 절대값, ABS(10) 절대값2
FROM dual;

-- 3.875를 소수 첫째자리까지 반올림한 값을 구하시오
SELECT ROUND(3.876, 1) AS 결과1,   -- 소수 첫째자리
       ROUND(3.876, 0) 결과2,   -- 정수
       ROUND(16.876, -1) 결과3,  -- 일의 자리
       ROUND(516.876, -2) 결과4  -- 십의 자리
FROM dual;

-- salary를 30일로 나눈 후 소수 자리수에 따라 절삭(버린)한 값 출력
SELECT salary,
       salary/30 일급,
       TRUNC(salary/30, 1) 결과1,
       TRUNC(salary/30, 0) 결과2,
       TRUNC(salary/30, -1) 결과3,
       TRUNC(salary/30, -2) 결과4
FROM employee;

-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
SELECT custid 고객번호, 
       ROUND(AVG(saleprice), -2) 평균금액
FROM orders
GROUP BY custid;

-- 문자 관련 함수
SELECT LPAD('cloud', 10, '*') FROM dual;
SELECT RPAD('cloud', 10, '*') FROM dual;

-- 부서 이름에서 처음부터 시작해서 두 개의 문자 출력
-- SUBSTR(칼럼명, 시작인덱스, 글자수)
SELECT SUBSTR(deptname, 1, 2) 팀명
FROM department;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경하여 검색하시오
SELECT bookid,
       REPLACE(bookname, '야구', '농구') bookname
FROM book;

-- 굿스포츠에서 출판한 도서의 제목과 글자수(바이트수)를 검색하시오.
SELECT bookname 제목,
       LENGTH(bookname) 글자수
FROM book
WHERE publisher = '굿스포츠';

-- 고객 이름에서 같은 성을 가진 사람의 인원수 구하시오.
-- GROPU BY절에 함수도 포함할 수 있음
SELECT SUBSTR(name, 1, 1) 성,
       COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);

-- 날짜, 시간 함수
-- 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오
-- 날짜에서 일수를 더할때 : date + 일수
SELECT orderid 주문번호, 
       orderdate 주문일,
       orderdate + 10 확정
FROM orders
WHERE orderid <= 5;

-- 주문번호가 6에서 10사이인 도서의 주문일에 3개월을 더한 값을 구하시오.
-- 개월 더하기 : ADD_MONTHS(날짜, 개월수)
SELECT orderid 주문번호, orderdate 주문일,
       ADD_MONTHS(orderdate, 3) 더하기_결과,
       ADD_MONTHS(orderdate, -3) 빼기_결과
FROM orders
WHERE orderid BETWEEN 6 AND 10;

-- 총 개월수: MONTHS_BETWEEN(종료일, 시작일)
-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오
SELECT orderid 주문번호, orderdate 주문일, SYSDATE 현재일,
       TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) 총개월수
FROM orders
WHERE orderid = 10;

-- 자동 타입 변환
-- 숫자, 문자 상호 전환 가능
SELECT 1 + '2' / '1'
FROM dual;

-- 수동 타입 변환
-- 숫자 형식 변환(문자를 숫자로 변환)
SELECT TO_NUMBER('250.3')
FROM dual;

-- 날짜 형식 : 날짜 문자열을 지정 형식의 날짜 타입으로 변환
-- TO_DATE(문자열, 날짜형식)
SELECT TO_DATE('2022/06/30', 'YYYY/MM/DD')
FROM dual;

-- 날짜를 문자 형식으로 변환
-- TO_CHAR(날짜, 날짜형식)
SELECT TO_CHAR(SYSDATE, 'YY') 년도,
       TO_CHAR(SYSDATE, 'YYYY') 년도_4,
       TO_CHAR(SYSDATE, 'MM') 월,
       TO_CHAR(SYSDATE, 'DD') 일,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD') 날짜
FROM dual;

-- 시간을 문자 형식으로 변환
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') 시간,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') 날짜와시간
FROM dual;

-- NVL(칼럼, 치환값)함수로 NULL 처리하기
SELECT custid, name, address,
       NVL(phone, '000-9000-111') phone
FROM customer
WHERE phone is NULL;
















