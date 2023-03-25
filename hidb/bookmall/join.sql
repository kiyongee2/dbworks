-- 2개 이상의 테이블에서 sql 질의
SELECT *
FROM orders;

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid;

-- 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid;

-- '박지성' 고객의 주문내역을 검색하시오(book 정보 포함)
SELECT *       
FROM customer, book, orders
WHERE customer.custid = orders.custid 
AND book.bookid = orders.bookid
AND customer.name = '박지성';

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

SELECT customer.name, AVG(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name;

-- INNER JOIN
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid
     ORDER BY cus.name;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
-- 총 판매액이 30000원 이상인 내역
SELECT customer.name, SUM(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name
Having SUM(saleprice) >= 30000
ORDER BY customer.name;


-- 고객의 이름과 고객이 주문한 도서의 이름과 가격을 검색하시오
--SELECT customer.name, book.bookname
--FROM customer, orders, book
--WHERE customer.custid = orders.custid 
--AND book.bookid = orders.bookid;

SELECT c.name, b.bookname, b.price
FROM book b, customer c, orders o
WHERE c.custid = o.custid
AND b.bookid = o.bookid;

-- 가격이 20000원 이상인 도서를 주문한 고객의 이름과 도서의 이름을 검색하시오
SELECT c.name, b.bookname, b.price
FROM book b, customer c, orders o
WHERE c.custid = o.custid
    AND b.bookid = o.bookid
    AND b.price >= 20000;
    
-- 도서를 구매하지 않은 고객을 포함하여 
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
     ON cus.custid = ord.custid;
     
SELECT cus.name, ord.saleprice
  FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+);











