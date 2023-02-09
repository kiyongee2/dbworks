SELECT first_name, salary * NVL(commission_pct, 1)
FROM t_employee2
ORDER BY commission_pct;

SELECT last_name, department_id, salary 원래급여,
       DECODE(department_id, 60, salary*1.1, salary) 조정급여,
       DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM t_employee2;

-- CASE~ WHEN 절--
SELECT last_name, department_id, salary 원래급여,
    CASE
        WHEN department_id = 60 THEN salary*1.1
        ELSE salary
    END 조정급여,
    CASE 
        WHEN department_id = 60 THEN '10%인상'
        ELSE '미인상'
    END 인상여부
FROM t_employee2;

SELECT DISTINCT job_id, department_id
FROM employees;

-- RANK() 순위
SELECT employee_id, last_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) 급여_RANK,
       DENSE_RANK() OVER(ORDER BY salary DESC) 급여_DENSE_RANK
FROM employees;

-- 같은 부서 내에서 직원의 급여 순위 정하기
SELECT department_id, first_name,
       salary,
       RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) 급여_RANK,
       DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) 급여_DENSE_RANK
FROM employees;