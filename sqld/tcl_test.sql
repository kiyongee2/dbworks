-- TCL(Transaction Control Language)
CREATE TABLE tcl_test(
    c1  NUMBER(2),
    c2  NUMBER(3)
);

SAVEPOINT t1;
INSERT INTO tcl_test VALUES (10, 100);
SAVEPOINT t2;
INSERT INTO tcl_test VALUES (20, 200);
ROLLBACK TO t2;

COMMIT;
SELECT * FROM tcl_test;

DROP TABLE tcl_test;