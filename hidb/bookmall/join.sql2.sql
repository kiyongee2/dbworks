-- bookmall 
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 대한민국에 거주하는 고객의 이름 
SELECT name 
FROM customer
WHERE address LIKE '%대한민국%';

-- 도서를 주문한 고객의 이름을 검색하시오(JOIN)
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- 도서를 주문한 고객의 이름을 검색하시오(SUBQUERY)
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- 대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름 검색
-- UNION은 중복을 포함하지 않음
SELECT name 
FROM customer
WHERE address LIKE '%대한민국%'
UNION
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- 대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름 검색
-- UNION ALL은 중복을 포함함
SELECT name 
FROM customer
WHERE address LIKE '%대한민국%'
UNION ALL
SELECT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- 동등조인(EQUI JOIN)
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- 박지성 고객이 주문한 도서의 판매 가격을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
  AND cus.name = '박지성';
  
-- 고객별로 고객이 주문한 도서의 총 판매금액을 검색하시오
SELECT cus.name, SUM(saleprice) 판매금액
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- 고객의 이름과 주문한 도서 이름과 판매 가격을 검색하시오
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
  AND bk.bookid = ord.bookid
  ORDER BY cus.name;
  
-- 박지성 고객이 주문한 도서 이름과 판매 가격을 검색하시오
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
  AND bk.bookid = ord.bookid
  AND cus.name = '박지성';

-- 표준 SQL 방식 - 내부 조인(INNER ~ JOIN ~ ON)
-- oracle의 동등조인과 유사함
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- oracle 방식
-- WHERE 절에 (+)사용
-- 모든 행이 출력되는 테이블의 반대편 테이블에 (+)를 붙여준다.
-- 주문이 없는 고객을 포함하여 이름과 고객이 주문한 도서의 판매가격을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- LEFT OUTER JOIN ~ ON : JOIN 조건에 충족하는 데이터가 아니어도 출력하는 방식
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- CROSS JOIN
-- 도서 테이블과 고객 테이블을 조인
-- 카테시안 곱 (10 x 5 = 50)
SELECT *
FROM book 
CROSS JOIN customer;

-- 박지성 고객이 주문한 도서 이름과 판매 가격을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    WHERE cus.name = '박지성';