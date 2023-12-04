-- 부서 테이블(dept)
CREATE TABLE dept(
    deptid    NUMBER PRIMARY KEY,   -- 기본키
    deptname  VARCHAR2(20) NOT NULL, -- NULL 불허
    location  VARCHAR2(20) NOT NULL
);

-- 부서 자료 추가 --
INSERT INTO dept(deptid, deptname, location)
VALUES (10, '전산팀', '서울');
INSERT INTO dept(deptid, deptname, location)
VALUES (20, '관리팀', '인천');
INSERT INTO dept(deptid, deptname, location)
VALUES (30, '마케팅팀', '수원');

SELECT SUBSTR(deptname, 1, 2) AS 팀명
FROM dept;

SELECT SUBSTR(deptname, 1, LENGTH(deptname)-1) AS 팀명
FROM dept;