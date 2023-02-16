-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값 구하기
SELECT custid AS 고객번호,
       ROUND(AVG(saleprice), -2) 평균금액
FROM orders
GROUP BY custid;

-- LPAD(), RPAD()
SELECT LPAD('cloud', 10, '*') FROM DUAL;

SELECT RPAD('cloud', 10, '*') FROM DUAL;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경하여 검색
SELECT bookid,
       REPLACE(bookname, '축구', '농구') bookname,
       publisher
FROM book;

-- -- SUBSTR()
SELECT SUBSTR(name, 1, 1) 성,
       COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);

-- 서점은 주문일로부터 10일 후 매출을 확정함
SELECT orderid 주문번호,
       orderdate 주문일,
       orderdate + 10 확정
FROM orders;

-- 주문번호가 6에서 10사이인 도서의 주문일에 3개월을 더한값을 구하기
SELECT orderid 주문번호, orderdate 주문일,
       ADD_MONTHS(orderdate, 3) 결과
FROM orders
WHERE orderid BETWEEN 6 AND 10;

-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수 구하기
SELECT orderid 주문번호, orderdate 주문일, SYSDATE 오늘,
       TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate), 0) 총개월수
FROM orders
WHERE orderid = 10;

-- TO_DATE()
SELECT TO_DATE('2023-01-10', 'yyyy/mm/dd') FROM DUAL;

-- TO_CHAR()
SELECT TO_CHAR(SYSDATE, 'YY') 년도,
       TO_CHAR(SYSDATE, 'MM') 월,
       TO_CHAR(SYSDATE, 'DD') 일,
       TO_CHAR(SYSDATE, 'YYYY/MM/DD') 날짜
FROM DUAL;


