-- ex2_1 테이블 --
CREATE TABLE ex2_1(
    column1 CHAR(10),
    column2 VARCHAR2(10),
    column3 NUMBER
);

INSERT INTO ex2_1(column1, column2, column3) VALUES ('abc', 'abc', 100);

SELECT * FROM ex2_1;

-- CHAR와 VARCHAR2의 크기 비교--
SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
FROM ex2_1;

