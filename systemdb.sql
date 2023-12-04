
SELECT LENGTH(column1) AS len1,
       LENGTH(column2) AS len2
  FROM ex2_1;

DESC ex2_5;
SELECT * FROM ex2_5;

-- 무결성 제약 조건 위배 --
INSERT INTO ex2_5(col_null, col_not_null) 
VALUES ('hello', '');

-- ex2_6 생성
CREATE TABLE ex2_6(
    id VARCHAR2(10) PRIMARY KEY,
    passwd VARCHAR2(10) NOT NULL
);

-- 테이블 이름 변경
ALTER TABLE ex2_6 RENAME TO login;

-- 칼럼 이름 변경
ALTER TABLE login RENAME COLUMN id TO userid;

-- 기본키 제약 
INSERT INTO login(userid, passwd) 
VALUES ('sky123', 'u12345');

INSERT INTO login(userid, passwd) 
VALUES ('sky123', 'u98765');

-- 칼럼 추가
ALTER TABLE login ADD name VARCHAR2(10);

-- 칼럼 자료형 변경
ALTER TABLE login MODIFY name VARCHAR2(20);

-- 테이블 복사
CREATE TABLE member AS
SELECT * FROM login;

SELECT * FROM login;



DROP TABLE ex2_3;