-- 제약(CONSTRAINT) 조건 --
CREATE TABLE ex2_4(
    col_1 VARCHAR2(10) PRIMARY KEY,
    col_2 NUMBER(2)
);

-- 기본키는 NOT NULL 이므로 NULL 입력 불가
INSERT INTO ex2_4 VALUES ('', 25);

INSERT INTO ex2_4 VALUES ('AA', 25);

-- 기본키는 중복 입력 불가
INSERT INTO ex2_4 VALUES ('AA', 25);

SELECT * FROM ex2_4;

SELECT * FROM departments;

INSERT INTO departments VALUES (100, 'Sample Dept', 200, 1700);

