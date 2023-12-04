-- bookmall join
-- 도서를 주문한 고객의 이름과 판매가격을 검색하시오
-- 동등 조인
SELECT cs.name, od.saleprice
FROM customer cs, orders od
WHERE cs.custid = od.custid;

SELECT cs.name, od.saleprice
FROM customer cs JOIN orders od
  ON cs.custid = od.custid;

-- 칼럼명이 같을때는 ON 대신 USING 사용 가능 
SELECT cs.name, od.saleprice
FROM customer cs JOIN orders od
  USING (custid);

-- 도서를 주문하지 않은 고객을 포함하여 
-- 고객의 이름과 주문 판매가격을 검색
SELECT cs.name, od.saleprice
FROM customer cs LEFT OUTER JOIN orders od
    ON cs.custid = od.custid;
    
SELECT od.saleprice, cs.name
FROM orders od RIGHT OUTER JOIN customer cs
    ON cs.custid = od.custid;
    
