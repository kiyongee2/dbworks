-- PRODUCT 테이블
CREATE TABLE product(
    product_code NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    price NUMBER NOT NULL
);

-- PRODUCT_REVIEW 테이블
CREATE TABLE product_review(
    review_no NUMBER PRIMARY KEY,
    member_id VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE,
    product_code NUMBER,
    FOREIGN KEY(product_code) REFERENCES product(product_code)
);

-- EVENT 테이블
CREATE TABLE event(
    event_no NUMBER PRIMARY KEY,
    event_name VARCHAR2(50),
    start_date DATE,
    end_date DATE
);


-- product 추가
INSERT INTO product VALUES (100001, '무소음 무선 마우스', 29500);
INSERT INTO product VALUES (100002, '기계식 게이밍 키보드', 32600);
INSERT INTO product VALUES (100003, '무결점 패널 광시야각 모니터', 179000);

-- product_review 추가
INSERT INTO product_review 
VALuES (1, 'sqlbaby01', '무소음인데 소음이 조금 있는 듯?', '20210320', 100001);
INSERT INTO product_review 
VALuES (2, 'sqlchild01', '무선이라 정말 편하네요!', '20210324', 100001);
INSERT INTO product_review 
VALuES (3, 'sqladult01', '게임할 맛 납니다.', '20210329', 100003);

-- product_review의 100002 -> 100001로 변경
UPDATE product_review SET product_code = 100001
WHERE review_no = 2;

-- event 추가
INSERT INTO event VALUES (301, '20% 할인쿠폰 증정', '20210314', '20210324');
INSERT INTO event VALUES (302, '마우스패드 증정', '20210325', '20210331');
INSERT INTO event VALUES (303, '벚꽃 축제 페스티벌', '20210414', '20210430');

SELECT * FROM product;
SELECT * FROM product_review;
SELECT * FROM event;

COMMIT;

-- EQUI JOIN : PRODUCT와 PRODUCT_REVIEW
SELECT a.product_code,
       a.product_name,
       a.price,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- Non EQUI JOIN : PRODUCT_REVIEW와 EVENT
SELECT a.event_name,
       b.member_id,
       b.content,
       b.regdate
FROM event a, product_review b
WHERE b.regdate BETWEEN a.start_date AND a.end_date;

-- INNER JOIN
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a INNER JOIN product_review b
    ON a.product_code = b.product_code;
    
-- LEFT OUTER JOIN : OUTER 생략 가능
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code;
    
-- RIGHT OUTER JOIN
SELECT a.member_id,
       a.content,
       a.regdate,
       b.product_code,
       b.product_name
FROM product_review a RIGHT OUTER JOIN product b
    ON a.product_code = b.product_code;
    
-- 스칼라 서브쿼리(Scalar Subquery)
-- PRODUCT_REVIEW 테이블에 존재하지 않는 PRODUCT_NAME 테이블 출력
SELECT re.product_code,
       (SELECT pr.product_name 
            FROM product pr
        WHERE pr.product_code = re.product_code) as product_name,
       re.member_id,
       re.content
FROM product_review re;

-- 스칼라 서브쿼리를 이용하여 PRODUCT_REVIEW 테이블에 존재하지 않는
-- PRODUCT_NAME, PRICE 데이터 출력
SELECT re.product_code,
       (SELECT pr.product_name 
            FROM product pr
        WHERE pr.product_code = re.product_code) as product_name,
        (SELECT pr.price 
            FROM product pr
        WHERE pr.product_code = re.product_code) as price,
       re.member_id,
       re.content
FROM product_review re;

-- 인라인 뷰(Inline View)
SELECT R.PRODUCT_CODE,
       P.PRODUCT_NAME,
       P.PRICE,
       R.MEMBER_ID,
       R.CONTENT
FROM PRODUCT_REVIEW R,
    (SELECT PRODUCT_CODE,
            PRODUCT_NAME,
            PRICE
      FROM  PRODUCT) P
WHERE R.PRODUCT_CODE = P.PRODUCT_CODE;

DROP TABLE product;
DROP TABLE product_review;