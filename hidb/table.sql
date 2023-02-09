-- 테이블 생성 --
CREATE TABLE ex2_1(
    column1    CHAR(10),
    column2    VARCHAR2(10),
    column3    NUMBER
)

CREATE TABLE ex2_4(
    col_date    DATE,
    col_timestamp TIMESTAMP
)

INSERT INTO ex2_4 VALUES (SYSDATE, SYSTIMESTAMP);

CREATE TABLE ex2_5(
    col_null    VARCHAR2(10),
    col_not_null VARCHAR2(10) NOT NULL
)

INSERT INTO ex2_5 VALUES ('Hello', '');

CREATE TABLE ex2_6(
    id   VARCHAR2(10) PRIMARY KEY,
    passwd VARCHAR2(10) NOT NULL
)

INSERT INTO ex2_6 VALUES ('sky2022', '1234mnop');
INSERT INTO ex2_6 VALUES ('sky2022', '1234abcd');


-- 테이블 이름 변경
ALTER TABLE ex2_6 RENAME TO login;

-- 칼럼 이름 변경
ALTER TABLE login RENAME COLUMN id TO userId;

-- 칼럼 추가
ALTER TABLE login ADD name VARCHAR2(10);

INSERT INTO login VALUES ('river2022', '1234abcd', '이강산');

-- 칼럼 타입 변경
ALTER TABLE login MODIFY name VARCHAR2(20);

DESC login;

-- 데이터 삽입 --
-- 문자는 홑따옴표 가능, 쌍따옴표 불가능
INSERT INTO ex2_1(column1, column2, column3) VALUES ('abc', 'abc', 10);
INSERT INTO ex2_1(column1, column2, column3) VALUES ('우리', '우리', 11);
--INSERT INTO ex2_1(column1, column2) VALUES ('대한민국', '대한민국', 12);

-- 데이터 검색 --
SELECT * FROM member;

-- CHAR과 VARCHAR2의 크기 비교 --
SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
    FROM ex2_1;
    
-- 테이블 복사
CREATE TABLE member AS
SELECT * FROM login;

-- 테이블 삭제
DROP TABLE login;
