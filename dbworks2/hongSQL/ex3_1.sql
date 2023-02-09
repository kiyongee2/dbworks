-- ex3_1 테이블 생성 --
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

-- col2의 값을 50으로 변경 --
UPDATE ex3_1
SET col2 = 50;

-- col3의 null을 찾아 현재 날짜로 변경하기 
UPDATE ex3_1
SET col3 = SYSDATE
WHERE col3 IS NULL;

COMMIT;

SELECT * FROM ex3_1;