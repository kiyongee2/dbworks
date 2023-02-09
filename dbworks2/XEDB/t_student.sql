-- t_student 테이블 생성
CREATE TABLE t_student(
    studentId NUMBER(3),
    studentName VARCHAR2(10) NOT NULL,
    PRIMARY KEY(studentId)
);

-- 학생 추가
INSERT INTO t_student VALUES (101, '이강');
INSERT INTO t_student VALUES (102, '김산');

-- 학생 조회
SELECT * 
FROM t_student 
ORDER BY studentId;

COMMIT;

