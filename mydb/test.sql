
CREATE TABLE test(
    msg VARCHAR2(30)
);

INSERT INTO test VALUES ('사랑합니다');

COMMIT;

SELECT * FROM test;