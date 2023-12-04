-- subquery
-- 다중행 서브쿼리 : 검색 결과가 여러개인 경우 IN 사용
-- 도서를 구매한 적이 있는 고객을 검색하시오
SELECT name
FROM customer
 WHERE custid IN (SELECT custid 
                    FROM orders);

-- 단일행 서브쿼리 : 검색 결과가 한 개인 경우 '=' 사용
-- 박지성 고객의 주문 내역을 검색하시오
SELECT *
FROM orders
 WHERE custid = (SELECT custid
                   FROM customer
                 WHERE name = '박지성');

-- subquery                 
-- '이상미디어'에서 출판한 도서를 구매한 고객의 이름을 검색하시오
SELECT name
FROM customer
WHERE custid IN (SELECT custid 
                  FROM orders
                WHERE bookid IN (SELECT bookid 
                                  FROM book
                                 WHERE publisher='이상미디어'));
                                 
-- join
SELECT DISTINCT cs.name
FROM book bk, customer cs, orders od
WHERE bk.bookid = od.bookid
  AND cs.custid = od.custid
  AND bk.publisher = '이상미디어';
              
-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 검색하시오
-- 튜플 변수 - 테이블 이름의 별칭
SELECT AVG(price) 가격평균
FROM book;

SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
                    FROM book b2
                  WHERE b2.publisher = b1.publisher);
                         
-- 고객 번호가 2이하인 고객의 이름과 고객의 판매액을 검색하시오.
-- 1. 동등 조인을 사용한 경우
SELECT cs.name, SUM(od.saleprice) AS total
FROM customer cs, orders od
WHERE cs.custid = od.custid
  AND cs.custid <= 2
GROUP BY cs.name;
--HAVING SUM(od.saleprice) >= 20000;

-- 2. subquery 사용 : FROM절(인라인뷰)
SELECT cs.name, SUM(od.saleprice) total
FROM (SELECT * FROM customer 
        WHERE custid <= 2) cs,
      orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- 스칼라 서브쿼리
-- 상품 리뷰 테이블에 없는 product_name 출력
SELECT a.product_code,
       (SELECT b.product_name -- b.price
         FROM product b
        WHERE a.product_code = b.product_code) as product_name,
       a.member_id,
       a.content
FROM product_review a;
                 