-- ex2_3 테이블 
CREATE TABLE ex2_3(
    col_null    VARCHAR2(10),
    col_not_null    VARCHAR2(10) NOT NULL
);

INSERT INTO ex2_3 VALUES ('hello', '');
-- NOT NULL 위배 --

INSERT INTO ex2_3 VALUES ('hello', 'Thank you!');

SELECT * FROM ex2_3;

