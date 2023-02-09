-- 동등 조인
-- 고객과 고객의 주문에 관한 데이터 모두 출력
SELECT * 
FROM Customer, Orders
WHERE customer.custid = orders.custid;

-- 고객의 이름과 주문한 도서의 판매가격 검색
SELECT name, saleprice
FROM Customer, Orders
WHERE customer.custid = orders.custid;

-- 고객별로 주문한 모든 도서의 총 판매액 가져오기
SELECT name, SUM(saleprice) AS 총판매액
FROM Customer, Orders
WHERE customer.custid = orders.custid
GROUP BY customer.name
ORDER BY customer.name;

-- 고객의 이름과 고객이 주문한 도서의 이름 구하기
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid=orders.custid AND book.bookid = orders.bookid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름 구하기
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid=orders.custid AND book.bookid = orders.bookid
		AND book.price = 20000;

-- 서브쿼리(부속 질의) : select문의 where절 내에 또 select문을 사용하는 질의문
-- 가격이 가장 높은 도서의 이름을 검색
SELECT bookname, price
FROM book
WHERE price=(SELECT MAX(price) FROM book);


