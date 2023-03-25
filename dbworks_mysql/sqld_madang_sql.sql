use madang;

SELECT DISTINCT publisher
FROM Book;

SELECT * FROM Book
WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM Book 
-- WHERE publisher IN ('굿스포츠', '대한미디어');
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

SELECT * FROM Book
WHERE bookname LIKE '_구%';

SELECT * FROM Book
WHERE bookname LIKE '%축구%' AND price >= 20000;

SELECT SUM(saleprice) "총매출"
FROM Orders;

SELECT SUM(saleprice) "총매출"
FROM Orders
WHERE custid = 2;

-- 고객별로 주문한 도서의 총 수량과 총 판매액 --
SELECT custid, COUNT(*) 도서수량, SUM(saleprice) 총액 
FROM Orders
GROUP BY custid;
-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량 집계 --
-- 단, 2권 이상 구매한 고객만 집계
SELECT custid, COUNT(*) 도서수량, SUM(saleprice) 총액 
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >=2;

-- 고객과 고객의 주문에 관한 데이터 출력 --
SELECT * 
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;

-- 고객별로 주문한 도서의 총 판매액, 고객별로 정렬 --
SELECT C.name, SUM(saleprice)
FROM Customer C, Orders O 
WHERE C.custid = O.custid
GROUP BY C.name
ORDER BY C.name;

-- 고객의 이름과 고객이 주문한 도서의 이름 출력 --
SELECT C.name, B.bookname
FROM Customer C, Book B, Orders O
WHERE C.custid = O.custid AND B.bookid = O.bookid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름 출력 --
SELECT C.name, B.bookname
FROM Customer C, Book B, Orders O
WHERE C.custid = O.custid AND B.bookid = O.bookid 
			AND O.saleprice = 20000;

-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 주문 도서의 판매 가격 출력 --            
SELECT C.name, O.saleprice
FROM Customer C LEFT OUTER JOIN Orders O 
		ON C.custid = O.custid;

-- 가장 비싼 도서의 이름과 가격 출력 --
SELECT bookname, price
FROM Book
WHERE price = (SELECT MAX(price) FROM Book);

