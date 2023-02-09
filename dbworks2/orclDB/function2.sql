SELECT * FROM employees;

-- substr(), upper() 함수 활용
SELECT employee_id, SUBSTR(first_name,1,1)||upper(last_name) as e_address 
FROM employees;

-- DECODE 함수 예제 1--
SELECT last_name, 
       department_id,
       salary 원래급여,
       DECODE(department_id, 60, salary*1.1, salary) 조정급여,
       DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM employees;

-- DECODE 함수 예제 2--

-- CASE ~ WHEN 절 --
SELECT last_name, department_id, salary 원래급여, 
       CASE
            WHEN department_id = 60 THEN salary*1.1
            ELSE salary
       END AS 조정급여,
       CASE
            WHEN department_id = 60 THEN '10% 인상'
            ELSE '미인상'
       END AS 인상여부
FROM employees;

