-- 주문 테이블 생성
CREATE TABLE orders(
    orderid     NUMBER PRIMARY KEY,
    custid      NUMBER NOT NULL,
    bookid      NUMBER NOT NULL,
    saleprice   NUMBER NOT NULL,
    orderdate   VARCHAR2(20) NOT NULL,
    FOREIGN KEY(custid) REFERENCES customer(custid),  --외래키(custid)
    FOREIGN KEY(bookid) REFERENCES book(bookid)       --외래키(bookid)
);

-- orders 자료 삽입
INSERT INTO orders VALUES (1, 1, 1, 6000, '2018-07-01');
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-07-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2018-07-03');
INSERT INTO orders VALUES (4, 3, 6, 6000, '2018-07-04');
INSERT INTO orders VALUES (5, 4, 7, 20000, '2018-07-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2018-07-07');
INSERT INTO orders VALUES (7, 4, 8, 13000, '2018-07-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2018-07-08');
INSERT INTO orders VALUES (9, 2, 10, 7000, '2018-07-09');
INSERT INTO orders VALUES (10, 3, 8, 13000, '2018-07-10');

COMMIT;

SELECT * FROM orders;

SELECT COUNT(*) as 총판매건수, 
       SUM(saleprice) 총판매액, 
       AVG(saleprice) 평균값
FROM orders;

-- 고객 아이디가 2번인 주문금액 총 매출액 계산
SELECT SUM(saleprice) as 총매출
FROM orders
WHERE custid = 2;

-- 고객별 고객아이디, 주문수량, 주문 총금액
SELECT custid, COUNT(*) AS 주문수량, SUM(saleprice) AS 주문총금액
FROM orders
GROUP BY custid;

SELECT custid, COUNT(*), SUM(saleprice)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >=2;

-- 고객과 주문 조인
-- 고객의 이름과 고객이 주문한 도서의 판매가격 검색
SELECT cus.custid, cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- 도서를 주문하지 않은 고객까지 포함하여 고객의 이름과 주문 도서의 판매가격 검색
SELECT cus.custid, cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+);

-- INNER JOIN ~ ON
SELECT cus.custid, cus.name, ord.saleprice
  FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid;
     
-- LEFT OUTER JOIN ~ ON
SELECT cus.custid, cus.name, ord.saleprice
  FROM customer cus LEFT OUTER JOIN orders ord
     ON cus.custid = ord.custid;

-- 고객아이디 및 고객 이름별 주문 금액 검색(이름별 정렬)
SELECT cus.custid, cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.custid, cus.name
ORDER BY cus.name;

-- 고객의 이름과 주문한 도서의 이름, 주문일, 주문금액 검색
SELECT customer.name, book.bookname, 
          orders.orderdate, orders.saleprice
FROM customer, book, orders
WHERE customer.custid = orders.custid
  AND book.bookid = orders.bookid;
