-- dbcp_test 테이블 만들기 --
CREATE TABLE dbcp_test(
    name    VARCHAR2(20) NOT NULL,
    email   VARCHAR2(30) PRIMARY KEY
);

SELECT * FROM dbcp_test;

DELETE FROM dbcp_test WHERE name='박마늘';

ROLLBACK;

COMMIT;
