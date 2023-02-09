--전체 상품의 주문 완료 건 총 매출, 평균 매추르 최고 매출, 최저 매출
SELECT COUNT(*)   전체주문건,
       SUM(B.sales) 총매출,
       TRUNC(AVG(B.sales), 2) 평균매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no;

-- 전체 상품의 총 판매량과 총 매출액, 전용 상품의 판매량과 매출액을 출력
SELECT COUNT(*)   총판매량,
       SUM(B.sales) 총매출,
       SUM(DECODE(B.item_id, 'M0001', 1, 0)) 전용상품판매량
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND A.cancel = 'N';

-- 각 상품별 전체 매출액을 내림차순으로 출력
SELECT C.item_id 상품아이디,
       C.product_name 상품이름,
       SUM(B.sales) 상품매출
FROM reservation A, order_info B, item C
WHERE A.reserv_no = b.reserv_no
AND b.item_id = c.item_id
GROUP BY c.item_id, c.product_name;





