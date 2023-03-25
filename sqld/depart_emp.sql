-- DEPART와 emp 만들기
CREATE TABLE depart(
    deptno VARCHAR2(4) PRIMARY KEY,
    deptname VARCHAR2(20)
);

CREATE TABLE emp(
    empno NUMBER(10),
    ename VARCHAR2(20),
    sal NUMBER(10) DEFAULT 0,
    deptno VARCHAR2(4) NOT NULL,
    createdate DATE DEFAULT SYSDATE,
    CONSTRAINT e_pk PRIMARY KEY(empno),
    CONSTRAINT d_fk FOREIGN KEY(deptno) 
        REFERENCES depart(deptno)
);
-- 외래키 삭제후 ON DELETE CASCADE 설정
ALTER TABLE emp DROP CONSTRAINT d_fk;
ALTER TABLE emp ADD CONSTRAINT d_fk FOREIGN KEY(deptno) 
        REFERENCES depart(deptno) ON DELETE CASCADE; 

INSERT INTO depart VALUES ('1000', '인사팀');
INSERT INTO depart VALUES ('1001', '총무팀');

INSERT INTO emp(empno, ename, sal, deptno) VALUES (100, '이젠', 1000000, '1000');
INSERT INTO emp VALUES (101, '이순신', 2000000, '1001', sysdate);
INSERT INTO emp VALUES (102, '유관순', 1500000, '1000', sysdate);

SELECT * FROM depart;
SELECT * FROM emp;

DELETE FROM depart WHERE deptno='1000';

DROP TABLE DEPART;
DROP TABLE EMP;

-- VIEW
CREATE VIEW vw_emp AS
  SELECT * FROM emp;
  
SELECT * FROM vw_emp;

DROP VIEW t_emp;

-- 정렬(인덱스)
SELECT * /*+ INDEX_DESC(A) */
FROM emp A;

SELECT DISTINCT DEPTNO 
FROM EMP;