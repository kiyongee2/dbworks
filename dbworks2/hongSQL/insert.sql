-- insert ±¸¹® --

SELECT * FROM departments
ORDER BY department_id DESC;

INSERT INTO departments VALUES (271, 'it_support', 100, 1700);
ROLLBACK;

DELETE FROM departments WHERE department_id = 271;
ROLLBACK;