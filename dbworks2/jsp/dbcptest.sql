-- dbcptest 테이블 만들기 --
CREATE TABLE dbcptest(
    name    VARCHAR2(20),
    email   VARCHAR2(30)
);

SELECT * FROM dbcptest;

DELETE FROM dbcptest;

COMMIT;