-- 뷰(VIEW)
-- 하나 이상의 테이블을 합하여 만든 가상의 테이블로써 실제
-- 테이블처럼 사용할 수 있는 데이터베이스 개체이다.
-- 사용이유 - 필요한 사용자에게 적절한 데이터를 제공(보고서)

-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만드세요.
CREATE VIEW vw_Customer
AS SELECT   *
   FROM     customer
   WHERE    address LIKE '%대한민국%';
   
-- 뷰이름으로 검색
SELECT *
FROM vw_Customer;

-- 고객의 이름과 주문 도서의 이름과 가격을 검색하시오
CREATE VIEW vw_Orders AS
SELECT customer.name, book.bookname, orders.saleprice
FROM customer, orders, book
WHERE customer.custid = orders.custid
AND book.bookid = orders.bookid;

-- 뷰 검색
SELECT *
FROM vw_Orders;

-- 뷰 삭제
DROP VIEW vw_Orders;







