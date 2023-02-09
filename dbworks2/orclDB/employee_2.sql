
SELECT * FROM employee;

-- 데이터 변경(수정)
UPDATE employee SET name = '오상식' WHERE companyID = 1001;

-- 변경시 실수시 ROLLBACK -> 복원
UPDATE employee SET name = '오상식';

ROLLBACK;

-- 커밋(수행)하면 복원할 수 없음
COMMIT;

-- 특정 데이터 삭제
DELETE FROM employee WHERE companyID = 2002;

-- 전체 데이터 삭제
DELETE FROM employee;

COMMIT;

