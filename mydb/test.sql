
CREATE TABLE test(
    msg VARCHAR2(30)
);

INSERT INTO test VALUES ('����մϴ�');

COMMIT;

SELECT * FROM test;