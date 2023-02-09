-- ex3_2 테이블 생성 --
CREATE TABLE ex3_2(
    emp_id  NUMBER,
    emp_name    VARCHAR2(20)  
);

SELECT * FROM ex3_2;

-- INSERT ~ SELECT --
-- 다른 테이블이나 뷰의 조회 결과로 나온 테이터를 
-- 또 다른 테이블에 넣는 형식 
INSERT INTO ex3_2(emp_id, emp_name)
SELECT employee_id, last_name
FROM employees
WHERE salary > 5000;