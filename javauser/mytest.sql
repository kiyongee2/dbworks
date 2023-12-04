
-- MYTEST 테이블 생성
CREATE TABLE mytest(
    msg  VARCHAR2(50)
);

INSERT INTO mytest VALUES ('안녕.. orcle dbms');

COMMIT;

SELECT * FROM mytest;