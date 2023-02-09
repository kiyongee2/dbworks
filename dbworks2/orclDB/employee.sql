-- employee 테이블 생성
CREATE TABLE employee(
    companyId   NUMBER(4) PRIMARY KEY,
    name        VARCHAR2(20)
);
-- 테이블 설명(구조)
DESC employee;

-- 자료 검색
SELECT * FROM employee ORDER BY companyId;

-- 자료 추가(삽입)
INSERT INTO employee VALUES (1001, 'steve');

-- 특정 데이터 검색 : WHERE 구문 사용
SELECT * FROM employee WHERE companyID = 3001;

SELECT * FROM employee WHERE companyID > 2000;

SELECT * FROM employee WHERE name = '한강';

-- 데이터 정렬(오름차순, 내림차순)하여 검색
SELECT * FROM employee ORDER BY companyID;

SELECT * FROM employee ORDER BY companyID DESC;

-- 데이터 삭제
DELETE FROM employee;

COMMIT;
ROLLBACK;
DROP TABLE employee;