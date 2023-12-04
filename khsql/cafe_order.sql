
CREATE TABLE drink(
    drink_code   CHAR(3) PRIMARY KEY,
    drink_name  VARCHAR2(30) NOT NULL
);

CREATE TABLE cafe_order(
    order_no     CHAR(10) PRIMARY KEY,
    drink_code   CHAR(3) NOT NULL,
    order_cnt    NUMBER NOT NULL,
    FOREIGN KEY(drink_code) REFERENCES drink(drink_code)
);

-- drink 자료 삽입
INSERT INTO drink VALUES ('A01', '아메리카노');
INSERT INTO drink VALUES ('B01', '카페라떼');

-- cafe_order 자료 삽입
INSERT INTO cafe_order VALUES ('2023100101', 'A01', 3);
INSERT INTO cafe_order VALUES ('2023100102', 'B01', 1);
INSERT INTO cafe_order VALUES ('2023100103', 'A01', 2);

SELECT * FROM drink;
SELECT * FROM cafe_order;

SELECT a.order_no,
       a.drink_code,
       b.drink_name,
       a.order_cnt
FROM cafe_order a, drink b 
WHERE a.drink_code = b.drink_code;

DROP TABLE cafe_order;
DROP TABLE drink;