-- departments 테이블 복사하기 --
CREATE TABLE t_department AS
SELECT * FROM departments;

-- 자료 검색
SELECT * FROM t_department 
ORDER BY department_id DESC;

-- 자료 추가
INSERT INTO t_department VALUES (271, 'Sample_Dept', 200, 1700);

-- 롤백 - 명령 취소
ROLLBACK;

-- 명령 실행 완료 : 트랜잭션
COMMIT;

-- 자료 수정

