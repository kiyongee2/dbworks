-- 학생 테이블 생성
CREATE TABLE t_student(
    studentId   NUMBER(3) PRIMARY KEY,
    studentName VARCHAR2(20) NOT NULL
);

INSERT INTO t_student VALUES (101, '이강');

SELECT * FROM t_student;