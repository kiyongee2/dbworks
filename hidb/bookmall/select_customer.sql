
-- 모든 고객의 이름과 주소를 검색하시오.
SELECT name, address
FROM customer;

-- 모든 고객의 이름, 주소, 전화번호를 검색하시오.
SELECT name, address, phone
FROM customer;

-- 주소가 '대한민국'인 고객을 검색하시오
SELECT * 
FROM customer 
WHERE address LIKE '%대한민국%';

-- 고객의 이름이 '김연아' 혹은 '안산'인 고객을 검색하시오
SELECT * 
FROM customer 
WHERE name IN ('김연아', '안산');

SELECT * 
FROM customer 
WHERE name = '김연아' OR name = '안산';

-- 주소가 '대한민국'이 아닌 고객을 검색하시오.
SELECT * 
FROM customer 
WHERE address NOT LIKE '%대한민국%';

-- 전화번호가 없는 고객을 검색하시오
SELECT * 
FROM customer 
WHERE phone is NULL;

-- 고객을 이름순으로 정렬하시오.
SELECT * 
FROM customer
ORDER BY name;

-- 고객의 총 인원수를 구하시오
SELECT COUNT(*) AS 총고객수
FROM customer;











