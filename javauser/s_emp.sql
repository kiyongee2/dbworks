-- jpa 연동
CREATE TABLE s_emp(
    id         NUMBER(7),
    name       VARCHAR2(30),
    start_date DATE,
    title      VARCHAR2(30),
    dept_name  VARCHAR2(30),
    salary     NUMBER(11, 2),
    CONSTRAINT s_emp_id_pk PRIMARY KEY(id)
);

INSERT INTO s_emp VALUES (1, '조혜원', '2010-12-01', '영업이사', '영업부', 15000000);

COMMIT;

SELECT id, name, start_date, title, dept_name, salary 
FROM s_emp ORDER BY name;

