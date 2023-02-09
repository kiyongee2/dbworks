
DESC t_student;

CREATE TABLE t_student2 AS
SELECT * FROM t_student;

INSERT INTO t_student2 VALUES (100, '이강');
INSERT INTO t_student2 VALUES (101, '이산');

COMMIT;

-- 칼럼 삭제
ALTER TABLE t_student2 DROP COLUMN studentId;

-- 칼럼 추가
ALTER TABLE t_student2 ADD (age NUMBER(3));


-- 칼럼 변경( 자료형의 크기를 10byte-> 20byte)
ALTER TABLE t_student2 MODIFY (studentName VARCHAR2(20));

-- 칼럼 이름 변경
ALTER TABLE t_student2 RENAME COLUMN age TO studentAge;

UPDATE t_student2 SET age=25 WHERE studentId = 101;

-- 테이블의 내용(자료) 모두 삭제하기 
TRUNCATE TABLE t_student2;


-- 테이블 삭제
DROP TABLE t_student2;

SELECT * FROM t_student2;