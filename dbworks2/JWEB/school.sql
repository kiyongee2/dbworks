-- 학과 테이블
CREATE TABLE department(
    dname VARCHAR2(30),
    dtel VARCHAR2(20),
    location VARCHAR2(20),
    PRIMARY KEY(dname)
);

-- 학생 테이블
CREATE TABLE student(
    snumber NUMBER(10),
    sname VARCHAR2(20),
    age NUMBER(3),
    gender VARCHAR2(4),
    address VARCHAR2(30),
    dname VARCHAR2(30),
    pnumber NUMBER(3),
    PRIMARY KEY(snumber),
    CONSTRAINT FK_dept_std FOREIGN KEY(dname)
    REFERENCES department(dname)
);

-- 학과 추가 --
INSERT INTO department VALUES ('소프트웨어학과', '02-1234-1234', 'B동 3층');  
INSERT INTO department VALUES ('화학공학과', '02-1234-4567', 'B동 4층');
INSERT INTO department VALUES ('전기전자공학과', '02-1234-5678', 'B동 5층');

-- 학생 추가 --
INSERT INTO student VALUES (20211234, '이강', 22, '여', '서울시 구로구', '소프트웨어학과');
INSERT INTO student VALUES (20211235, '박대양', 25, '남', '서울시 성동구', '전기전자공학과');
INSERT INTO student VALUES (20211236, '한비야', 23, '여', '서울시 강남구', '소프트웨어학과');
INSERT INTO student VALUES (20211237, '정산들', 27, '남', '경기도 수원시', '화학공학과');

TRUNCATE TABLE student;
DROP TABLE student;
DROP TABLE professor;
DROP TABLE department;

SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM professor;

-- 교수 추가
INSERT INTO professor VALUES (301, '박은종', 'JAVA 프로그래밍');
INSERT INTO professor VALUES (402, '송미영', 'JSP 웹프로그래밍');
INSERT INTO professor VALUES (501, '송형경', '데이터베이스');

INSERT INTO student VALUES (20211234, '이강', 22, '여', '서울시 구로구', '소프트웨어학과');
INSERT INTO student VALUES (20211235, '박대양', 25, '남', '서울시 성동구', '전기전자공학과');
INSERT INTO student VALUES (20211236, '한비야', 23, '여', '서울시 강남구', '소프트웨어학과');
INSERT INTO student VALUES (20211237, '정산들', 27, '남', '경기도 수원시', '화학공학과');