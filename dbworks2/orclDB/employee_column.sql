-- employee 테이블 생성
CREATE TABLE employee(
    companyID   number(4) primary key,
    name        varchar2(20)
);
-- 테이블 설명(구조)
DESC employee;

-- 자료 검색
SELECT * FROM employee;

-- 칼럼 추가
ALTER TABLE employee ADD(joinDate DATE);
