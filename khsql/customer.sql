-- 고객 테이블 생성
CREATE TABLE customer(
    custid      NUMBER PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    address     VARCHAR2(50),
    phone       VARCHAR2(20)
);

-- customer 자료 삽입
INSERT INTO customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO customer VALUES (3, '안산', '대한민국 광주광역시', '000-7000-0001');
INSERT INTO customer VALUES (4, '류현진', '미국 토론토', NULL);
INSERT INTO customer VALUES (5, '손흥민', '영국 토트넘', '000-8000-0001');

COMMIT;

SELECT * FROM customer;

-- 동등조인
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
--  A INNER JOIN B ON 조건
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하고 
-- 고객의 이름은 오름차순, 판매가격은 내림차순 정렬하시오.
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.name, orders.saleprice DESC;

SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
AND customer.name = '박지성';

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하고
-- 도서를 주문하지 않은 고객도 포함하여 검색하시오
-- WHERE 절(+)
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid(+);

-- OUTER JOIN
--  A LEFT OUTER JOIN B ON 조건
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid;

DROP TABLE customer;