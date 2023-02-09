
SELECT * FROM departments ORDER BY department_id DESC;

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES 
(272, 'Sample_Dept', 200, 1700);

ROLLBACK;

COMMIT;

UPDATE departments
SET    manager_id = 201,
       location_id = 1800
WHERE  department_name = 'Sample_Dept';

ROLLBACK;

COMMIT;

DELETE FROM departments
WHERE department_name = 'Sample_Dept';

COMMIT;
-- 전체 데이터 삭제하기
DELETE FROM departments;