
SELECT ABS(-10) FROM DUAL;

SELECT ROUND(327.56, 1) FROM DUAL;

SELECT ROUND(327, -1) FROM DUAL;

SELECT ROUND(327, -2) FROM DUAL;

SELECT TRUNC(327.56, -1) FROM DUAL;

SELECT custid, ROUND(AVG(saleprice), 2) AS 평균금액
FROM orders
GROUP BY custid;

SELECT custid 고객번호, COUNT(*) 주문수, SUM(saleprice) 총액
FROM orders
GROUP BY custid;

SELECT custid 고객번호, ROUND(SUM(saleprice)/COUNT(*), -2) 평균금액
FROM orders
GROUP BY custid;

-- salary를 30일로 나눈 후 소수 자리수에 따라 반올림한 값 출력
SELECT salary,
       salary/30 일급,
       ROUND(salary/30, 1) 결과1,
       ROUND(salary/30, 0) 결과2,
       ROUND(salary/30, -1) 결과3
FROM emp;

-- salary를 30일로 나눈 후 소수 자리수에 따라 절삭(버림)한 출력
SELECT salary,
       salary/30 일급,
       TRUNC(salary/30, 1) 결과1,
       TRUNC(salary/30, 0) 결과2,
       TRUNC(salary/30, -1) 결과3
FROM emp;

-- 문자 타입
-- 소문자로 변경하기
SELECT LOWER('ABCD') RESULT FROM DUAL;

-- SUBSTR(문자, 인덱스, 글자수) : 글자수 추출하기
SELECT SUBSTR('ABC', 1, 2) RESULT FROM DUAL;

-- REPLACE(문자, 이전문자, 새로운문자) : 문자 변경하기
SELECT REPLACE('ABC', 'A', 'E') RESULT FROM DUAL;

-- CONCAT(문자1, 문자2) - 문자 연결
SELECT CONCAT('A', 'B') RESULT FROM DUAL;

-- 연결연산자 - '||'
SELECT '안녕' || '하세요' RESULT FROM DUAL;

-- LPAD(문자, 문자수, 기호) - 기호를 왼쪽부터 채움
-- RPAD(문자, 문자수, 기호) - 기호를 오른쪽부터 채움
SELECT LPAD('cloud', 10, '*') RESULT FROM DUAL;
SELECT RPAD('cloud', 10, '*') RESULT FROM DUAL;

-- 도서 제목에 '야구'가 포함된 도서를 '농구'로 변경하여 검색
SELECT bookid,
       REPLACE(bookname, '야구', '농구') bookname
FROM BOOK;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 검색
-- 한글 3Byte, 영어, 특수기호 - 1Byte
SELECT bookname,
       LENGTH(bookname)문자수,
       LENGTHB(bookname) 바이트수
FROM book
WHERE publisher = '굿스포츠';

-- 고객 이름(별)에서 같은 성을 가진 사람의 인원수를 구하시오
-- 힌트, GROUP BY절, SUBSTR(), COUNT(*)
SELECT SUBSTR(name, 1, 1) 성, COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);

-- 날짜 함수
-- 날짜 출력
SELECT SYSDATE FROM DUAL;

-- 날짜와 시간
SELECT SYSTIMESTAMP FROM DUAL;

-- 20일전의 날짜 출력
SELECT SYSDATE - 20 FROM DUAL;

-- 3개월 후의 날짜 출력
SELECT ADD_MONTHS(SYSDATE, 3) 결과 
FROM DUAL;
-- 3개월 전의 날짜 출력
SELECT ADD_MONTHS(SYSDATE, -3) 결과 
FROM DUAL;

-- 특정일에서 3개월 전의 날짜 출력
SELECT ADD_MONTHS('2023/04/01', -3) 결과 
FROM DUAL;

-- 특정한 날에서 10일후(특정한 날: 문자형 -> 날짜형)
-- SELECT TO_DATE('2023/10/01') + 10 FROM DUAL;
SELECT TO_DATE('2023-10-01') + 10 결과 
FROM DUAL;

-- 입사일 : 2022-1-1, 퇴사일 : 2023-1-31(월수 계산)
SELECT
    ROUND(MONTHS_BETWEEN(TO_DATE('2022-12-31'), 
            TO_DATE('2022-1-1')), 0) 총개월수
FROM DUAL;

-- 주문번호가 6에서 10사이인 도서의 주문일에 3개월을 더한값을 구하시오.
-- 1. 주문번호가 6~10인 도서 검색
-- 2. 주문일에 3개월 더하기, 빼기
SELECT orderid 주문번호,
       ADD_MONTHS(orderdate, 3) 더하기결과,
       ADD_MONTHS(orderdate, -3) 빼기결과
FROM orders
--WHERE orderid >=6 AND orderid <= 10;
WHERE orderid BETWEEN 6 AND 10;

-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오
-- MONTHS_BETWEEN(이후날짜, 이전날짜)
SELECT orderid 주문번호, 
       orderdate 주문일,
       TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) 총개월수
FROM orders
WHERE orderid = 10;

-- 서점은 주문일로부터 10일후 매출을 확정한다. 
-- 각 주문의 확정일자를 구하시오.
SELECT orderid 주문번호, 
       orderdate 주문일,
       TO_DATE(orderdate) + 10 확정일
FROM orders;

-- 자동 타입 변환
SELECT 1 + '2' FROM DUAL;

-- 수동 타입 변환
-- 문자를 숫자 형식으로 변환
SELECT TO_NUMBER('120') 결과 FROM DUAL;

-- 날짜 형식(지정된 날짜 형식으로 출력됨)
SELECT TO_DATE('2022-06-30') FROM DUAL;

-- 날짜 형식 변환
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') 날짜,
       TO_CHAR(SYSDATE, 'YYYY') 연도,
       TO_CHAR(SYSDATE, 'MM') 월,
       TO_CHAR(SYSDATE, 'DD') 일
FROM DUAL;

-- 시간 형식 변환
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS AM') 시간형식,
       TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') 날짜와시간
FROM DUAL;