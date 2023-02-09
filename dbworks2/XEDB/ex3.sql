CREATE TABLE ex3_1(
    col1    VARCHAR2(10),
    col2    NUMBER,
    col3    DATE
);

-- 테이블(해당칼럼), 칼럼에 들어갈 값
INSERT INTO ex3_1(col1, col2, col3)
VALUES ('ABC', 10, SYSDATE);

-- 해당칼럼을 생략한 경우 --
INSERT INTO ex3_1 VALUES ('DEF', 20, SYSDATE);

-- 칼럼을 일부만 사용한 경우 --
INSERT INTO ex3_1(col1, col2)
VALUES ('GHI', 30);

SELECT * FROM ex3_1;