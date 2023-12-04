-- book 테이블 생성
CREATE TABLE book(
    bookid     NUMBER PRIMARY KEY,
    bookname   VARCHAR2(40) NOT NULL,
    publisher  VARCHAR2(40) NOT NULL,
    price      NUMBER NOT NULL
);

INSERT INTO book VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO book VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES (6, '양궁의 실제', '굿스포츠', 6000);
INSERT INTO book VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES (10, 'Olympic Champions', 'Pearson', 13000);

COMMIT;

-- 도서의 최고가, 최저가 검색
SELECT MAX(price) AS 최고가격, MIN(price) AS 최저가격 
FROM book;

-- 서브 쿼리
-- 가장 비싼 도서의 이름 검색
SELECT bookname, price
FROM book
 WHERE price = (SELECT MAX(price) FROM book);
 
-- 도서를 구매한 적이 있는 고객의 이름 검색
SELECT name
FROM customer
  WHERE custid IN(SELECT custid FROM orders);
  
-- '박지성' 고객의 주문 내역 검색
SELECT *
FROM orders
  WHERE custid IN(SELECT custid 
                    FROM customer 
                      WHERE name = '박지성');

DROP TABLE book;