-- product 테이블 생성
CREATE TABLE product(
    product_code  CHAR(6) PRIMARY KEY,   -- 상품 코드
    product_name  VARCHAR2(50) NOT NULL, -- 상품명
    price        NUMBER NOT NULL         -- 가격
);

INSERT INTO product VALUES ('100001', '무소음 무선 마우스', 25000);
INSERT INTO product VALUES ('100002', '기계식 게이밍 키보드', 30000);
INSERT INTO product VALUES ('100003', '무결점 패널 광시야각 모니터', 120000);

-- product_review 테이블 생성
CREATE TABLE product_review(
    review_no     NUMBER PRIMARY KEY,     -- 리뷰번호
    product_code  CHAR(6),                -- 상품코드
    member_id     VARCHAR2(20) NOT NULL,  -- 회원아이디
    content       CLOB NOT NULL,          -- 리뷰내용
    regdate       DATE DEFAULT SYSDATE,   -- 리뷰작성일
    FOREIGN KEY(product_code) REFERENCES product(product_code)
);
CREATE SEQUENCE seq_prod NOCYCLE; -- 리뷰 자동 순번
INSERT INTO product_review (review_no, product_code, member_id, content)
VALUES (seq_prod.NEXTVAL, '100001', 'today123', '무소음인데 소음이 조금 있는 듯');
INSERT INTO product_review (review_no, product_code, member_id, content)
VALUES (seq_prod.NEXTVAL, '100001', 'cloud100', '무선이라 정말 편하네요');
INSERT INTO product_review (review_no, product_code, member_id, content)
VALUES (seq_prod.NEXTVAL, '100002', 'sky321', '게임할 맛 납니다.');

-- event 테이블 생성
CREATE TABLE event(
    event_no    NUMBER PRIMARY KEY,     -- 이벤트 번호
    event_name  VARCHAR2(30) NOT NULL,  -- 이벤트 이름
    start_date  VARCHAR2(20) NOT NULL,  -- 이벤트 시작일
    end_date    VARCHAR2(20) NOT NULL   -- 이벤트 종료일
);
CREATE SEQUENCE seq_event NOCYCLE; -- 이벤트 자동 순번

INSERT INTO event (event_no, event_name, start_date, end_date)
VALUES (seq_event.NEXTVAL, '20% 할인 쿠폰 증정', '2023-10-10', '2023-10-20');
INSERT INTO event (event_no, event_name, start_date, end_date)
VALUES (seq_event.NEXTVAL, '마우스 패드 증정', '2023-11-15', '2023-11-10');
INSERT INTO event (event_no, event_name, start_date, end_date)
VALUES (seq_event.NEXTVAL, '벚꽃 축제 페스티벌', '2023-12-10', '2023-12-30');

SELECT * FROM product;
SELECT * FROM product_review;
SELECT * FROM event;

-- 동등 조인(EQUI JOIN) 실습
-- 상품에 review가 있는 상품코드, 상품명, 리뷰를 작성한 회원아이디, 
-- 리뷰내용, 리뷰 등록일을 출력
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 위의 검색 데이터에서 무소음 무선 마우스 리뷰만 출력 출력
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code
  AND a.product_code = '100001';
  
-- Non EQUI JOIN
-- 이벤트 기간 동안 리뷰를 작성한 고객에게 사은품을 주는 행사를 하고 있다고 가정
-- 리뷰 테이블과 이벤트 테이블 조인
SELECT a.event_name,
       b.member_id,
       b.content,
       b.regdate
FROM event a, product_review b
WHERE b.regdate BETWEEN a.start_date AND a.end_date;

DROP TABLE product_review;
DROP SEQUENCE seq_prod;

-- 리뷰를 남긴 상품 정보 검색하기
-- 1. 동등조인
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- 2. INNER JOIN ~ ON
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a INNER JOIN product_review b
   ON a.product_code = b.product_code;

-- 모든 칼럼 검색
SELECT a.*,
       b.*
FROM product a JOIN product_review b
   ON a.product_code = b.product_code;

-- JOIN ~ USING 사용
-- 단, alias(별칭)을 사용할 수 없음
SELECT product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a JOIN product_review b
   USING (product_code);
   
-- 리뷰를 남기지 않은 상품도 포함하여 모든 상품 정보 검색하기
-- 1. 동등조인
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code(+);

-- 2. LEFT OUTER JOIN
SELECT a.product_code,
       a.product_name,
       b.member_id,
       b.content,
       b.regdate
FROM product a LEFT OUTER JOIN product_review b
   ON a.product_code = b.product_code;
   
-- 2. RIGHT OUTER JOIN
SELECT a.member_id,
       a.content,
       a.regdate,
       b.product_code,
       b.product_name
FROM product_review a RIGHT OUTER JOIN product b
   ON a.product_code = b.product_code;


TRUNCATE TABLE event;

