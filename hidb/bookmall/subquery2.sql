
SELECT * FROM book;

-- 서점의 고객별 판매액을 검색하시오(고객별 이름과, 판매액)
-- 인라인 뷰
SELECT cs.name, SUM(saleprice) total
FROM (SELECT custid, name
        FROM customer) cs,
        orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- 고객 번호가 2이하인 서점의 고객별 판매액 검색
SELECT cs.name, SUM(saleprice) total
FROM (SELECT custid, name
        FROM customer
        WHERE custid <= 2) cs,
        orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- EQUI JOIN
SELECT cs.name, SUM(saleprice)
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

-- 스칼라 subquery
SELECT (SELECT name 
        FROM customer cs 
        WHERE cs.custid = od.custid) name, SUM(saleprice) total
FROM orders od
GROUP BY custid;

