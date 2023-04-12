-- function

SELECT custid 고객번호, ROUND(SUM(saleprice)/COUNT(*)) 평균금액
FROM orders
GROUP BY custid;


SELECT SUBSTR(name, 1, 1) 성,
       COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);

