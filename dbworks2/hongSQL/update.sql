-- update 구문 --
SELECT * 
FROM departments
ORDER BY department_id DESC;

INSERT INTO departments 
VALUES (271, 'Sample_Dept', 200, 1700);

COMMIT;

-- departments에서 department_name이 Sample_Dept인 
-- manager_id를 201, location_id를 1800으로 변경하기
UPDATE departments
SET manager_id = 201,
    location_id = 1800;
--WHERE department_name = 'Sample_Dept';

ROLLBACK;
