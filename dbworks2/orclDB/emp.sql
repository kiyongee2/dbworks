SELECT * FROM employees;

-- employees 테이블을 emp 테이블을 생성하여 복사하기 --
CREATE TABLE emp AS SELECT * FROM employees;

SELECT * FROM emp;

-- salary가 10000달러에서 20000달러 사이인 사원의 정보 --
SELECT * 
FROM emp
WHERE salary BETWEEN 10000 AND 20000;




