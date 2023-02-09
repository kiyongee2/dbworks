-- INSERT SELECT --
CREATE TABLE ex4(
    empId NUMBER(6, 0),
    empName VARCHAR2(25)
);

INSERT INTO ex4
SELECT employee_id, last_name
FROM employees
WHERE salary > 5000;

SELECT * FROM employees;
