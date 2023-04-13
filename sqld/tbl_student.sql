-- 학생 테이블
CREATE TABLE tbl_student(
    snumber NUMBER(8) PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    gender  VARCHAR2(6) NOT NULL,
    address VARCHAR2(50),
    cid   NUMBER(3) NOT NULL,
    --외래키 제약조건(학과)
    CONSTRAINT fk_class FOREIGN KEY(cid) 
    REFERENCES tbl_class(cid) ON DELETE CASCADE
);

-- 학생 자료 삽입
INSERT INTO tbl_student VALUES (20211234, '이강', 22, '여자', '서울시 종로구', 102);
INSERT INTO tbl_student VALUES (20211235, '박대양', 25, '남자', '경기도 성남시', 101);
INSERT INTO tbl_student VALUES (20211236, '한비야', 23, '여자', '경기도 수원시', 103);

select * from tbl_student;