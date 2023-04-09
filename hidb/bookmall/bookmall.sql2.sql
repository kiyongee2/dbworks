-- 도서 이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색
SELECT * 
FROM book
WHERE bookname LIKE '_구%';

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
SELECT *
FROM book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

SELECT SUM(saleprice)
FROM orders
WHERE custid = 2;

SELECT SUM(saleprice) AS Total,
       AVG(saleprice) AS Average,
       MIN(saleprice) AS Minimum
FROM orders;

SELECT COUNT(DISTINCT publisher)
FROM book;

SELECT custid, COUNT(*) 도서수량
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;

SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid DESC;

SELECT name, saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
    AND customer.name = '안산';
    
-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
SELECT name, SUM(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name
ORDER BY customer.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid
  AND orders.bookid = book.bookid;
  
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- 주문이 없는 고객을 포함하여 이름과 고객이 주문한 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- 주문이 없는 고객을 포함하여 이름과 고객이 주문한 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;
  
-- 가장 비싼 도서의 이름을 보이시오
SELECT MAX(price) FROM book;

SELECT bookname
FROM book
WHERE price = 35000;

SELECT bookname, price
FROM book
WHERE price = 
   (SELECT MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
select custid
from orders;

select name
from customer
where custid in (1, 2, 3, 4);

SELECT name
FROM customer
WHERE custid IN (SELECT custid
                 FROM orders);


SELECT name, saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
    AND customer.name = '박지성';
 
-- '김연아' 고객의 주문내역을 검색하시오
SELECT custid
    FROM customer
    WHERE name = '김연아';   
    
SELECT *
FROM orders
WHERE custid = (SELECT custid
                FROM customer
                WHERE name = '김연아');
                
-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
                  from book b2
                  where b2.publisher=b1.publisher);
                  
-- 마당 서점의 고객별 판매액을 보이시오(고객이름과 고객별 판매액 출력)
SELECT (SELECT name
        FROM customer cs
        WHERE cs.custid=od.custid) name, SUM(saleprice) total
FROM orders od
GROUP BY od.custid;

-- 고객번호가 2 이하인 고객의 판매액을 검색하시오.
SELECT cs.name, SUM(od.saleprice) 판매액
FROM(SELECT custid, name
       FROM customer
       WHERE custid <= 2) cs,
       orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- 대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름을 검색하시오
select name
from customer
where address like '대한민국%'
UNION ALL
select name
from customer
where custid in (SELECT custid FROM orders);

-- 주문이 있는 고객의 이름과 주소를 보이시오
select name, address
from customer cs
where NOT EXISTS(select *
             from orders od
             where cs.custid=od.custid);








