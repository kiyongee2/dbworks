-- 집계 함수와 GROUP BY
-- 고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS 총매출
FROM orders;

-- '김연아' 고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS 총매출
FROM orders
WHERE custid = 2;

-- 고객이 주문한 도서의 총 판매액, 평균값을 구하시오
SELECT SUM(saleprice) AS Total,
       AVG(saleprice) AS Average  
FROM orders;

-- 마당 서점의 도서 판매 건수를 구하시오
SELECT COUNT(*) AS 총판매건수
FROM orders;

-- 이상미디어 출판사의 평균 도서가격을 구하시오
SELECT AVG(price) AS 평균가격
FROM book
WHERE publisher = '이상미디어';

-- 고객별로 주문한 도서의 총 수량과 판매액을 구하시오
SELECT custid, COUNT(*) 도서수량, SUM(saleprice) 총액
FROM orders
GROUP BY custid;

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오.
-- 단 2권 이상 구매한 고객만 구하시오.
-- HAVING 절은 GROUP BY 질의 결과 나타내는 그룹을 제한하는 역할을 한다.
SELECT custid, COUNT(*) 도서수량
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;