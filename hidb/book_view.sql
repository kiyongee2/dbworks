-- VIEW
-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오.
-- 뷰의 이름은 vw_Customer로 설정하시오
CREATE VIEW vw_Customer AS 
SELECT *
FROM Customer
WHERE address LIKE '%대한민국%';

-- 뷰 이름으로 검색
SELECT *
FROM vw_Customer;

-- 고객의 이름과 주문한 도서의 이름과 가격을 검색하시오
CREATE VIEW vw_Orders AS
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid 
AND book.bookid = orders.bookid;

SELECT * 
FROM vw_Orders;

-- 뷰 삭제
DROP VIEW vw_Customer;
