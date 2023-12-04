/*
-- ��1 ������
CREATE TABLE entertainer(
    name       VARCHAR2(20),
    birthday   VARCHAR2(20),
    job        VARCHAR2(50)
);

INSERT INTO entertainer VALUES ('�絿��', '19790601', '���,����');
INSERT INTO entertainer VALUES ('������', '19920904', '���');
INSERT INTO entertainer VALUES ('�����', '19820220', '����,�۰�');
*/
CREATE TABLE entertainer(
    name       VARCHAR2(20),
    birthday   VARCHAR2(20)
);

INSERT INTO entertainer VALUES ('�絿��', '19790601');
INSERT INTO entertainer VALUES ('������', '19920904');
INSERT INTO entertainer VALUES ('�����', '19820220');

CREATE TABLE job(
    name       VARCHAR2(20),
    job        VARCHAR2(50)
);

INSERT INTO job VALUES ('�絿��', '���');
INSERT INTO job VALUES ('�絿��', '����');
INSERT INTO job VALUES ('������', '���');
INSERT INTO job VALUES ('�����', '����');
INSERT INTO job VALUES ('�����', '�۰�');

COMMIT;

SELECT * FROM job;

SELECT * FROM job WHERE job = '����';

DROP TABLE entertainer;