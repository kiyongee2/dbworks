-- ROWNUM
SELECT ROWNUM, employee_id
    FROM employees
WHERE ROWNUM < 5;

-- ROWNUM은 SELECT만 가능하다.(삭제, 수정 불가)
DELETE FROM employees WHERE ROWNUM = 4;
