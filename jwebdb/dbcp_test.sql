
CREATE TABLE dbcp_test(
    name  VARCHAR2(20) NOT NULL,
    email VARCHAR2(30) PRIMARY KEY
);

INSERT INTO dbcp_test VALUES ('±è±â¿ë', 'giyong@test.com');

SELECT * FROM dbcp_test;

DELETE from dbcp_test;