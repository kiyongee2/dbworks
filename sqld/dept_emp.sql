-- 부서 테이블
CREATE TABLE department(
    deptid      NUMBER,
    deptname    VARCHAR2(20) NOT NULL,
    location    VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid)
);

CREATE TABLE employee(
    empid      NUMBER PRIMARY KEY,
    empname    VARCHAR2(20) NOT NULL,
    age        NUMBER,
    salary     NUMBER,
    deptid      NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES department(deptid)  
);

-- employee 테이블에 gender 칼럼 추가
ALTER TABLE employee ADD gender VARCHAR2(10);

-- 부서 자료 추가
INSERT INTO department VALUES (10, '전산팀', '서울');
INSERT INTO department VALUES (20, '총무팀', '인천');

-- 사원 자료 추가
INSERT INTO employee VALUES (101, '이강', 27, 2500000, 10);
INSERT INTO employee VALUES (102, '김산', 28, 2000000, 20);
INSERT INTO employee VALUES (103, '박대양', 27, 3500000, 10);
INSERT INTO employee VALUES (104, '신세계', 28, 1000000, 20);
INSERT INTO employee VALUES (105, '강남', 28, 2000000, 20);
INSERT INTO employee VALUES (103, '정들', 35, 3000000, 30); -- 부서코드 없음
INSERT INTO employee VALUES (106, '김하나', 38, 3000000, 20, '여자');
INSERT INTO employee VALUES (107, '한성년', 47, 4500000, 20, '남자');

-- INSERT INTO (SELECT 절)
INSERT INTO 

-- 사원 자료 수정
UPDATE employee SET gender = '여자' WHERE empid = 101;
UPDATE employee SET gender = '남자' WHERE empid = 102;
UPDATE employee SET gender = '남자' WHERE empid = 103;
UPDATE employee SET gender = '여자' WHERE empid = 105;

-- 사원 자료 삭제
DELETE FROM employee WHERE empid = 106 OR empid = 107;

-- 부서 삭제
DELETE FROM department WHERE deptid = 20; -- employee 테이블에서 참조하고 있어 오류.

ALTER TABLE employee DROP CONSTRAINT EMP_FK;

SELECT * FROM employee;
SELECT * FROM department;

-- 테이블 삭제 - CONSTRAINT가 설정되어 있는 경우
DROP TABLE department CASCADE CONSTRAINTS;

DROP TABLE department;
DROP TABLE employee;

DELETE FROM employee;

DESC employee;




