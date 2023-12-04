/*
-- 제1 정규형
CREATE TABLE entertainer(
    name       VARCHAR2(20),
    birthday   VARCHAR2(20),
    job        VARCHAR2(50)
);

INSERT INTO entertainer VALUES ('양동근', '19790601', '배우,가수');
INSERT INTO entertainer VALUES ('박은빈', '19920904', '배우');
INSERT INTO entertainer VALUES ('장기하', '19820220', '가수,작가');
*/
CREATE TABLE entertainer(
    name       VARCHAR2(20),
    birthday   VARCHAR2(20)
);

INSERT INTO entertainer VALUES ('양동근', '19790601');
INSERT INTO entertainer VALUES ('박은빈', '19920904');
INSERT INTO entertainer VALUES ('장기하', '19820220');

CREATE TABLE job(
    name       VARCHAR2(20),
    job        VARCHAR2(50)
);

INSERT INTO job VALUES ('양동근', '배우');
INSERT INTO job VALUES ('양동근', '가수');
INSERT INTO job VALUES ('박은빈', '배우');
INSERT INTO job VALUES ('장기하', '가수');
INSERT INTO job VALUES ('장기하', '작가');

COMMIT;

SELECT * FROM job;

SELECT * FROM job WHERE job = '가수';

DROP TABLE entertainer;