-- person 테이블
CREATE TABLE person(
    userid  VARCHAR2(10) PRIMARY KEY,
    userpw  VARCHAR2(10) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    age     NUMBER(3)
);

INSERT INTO person VALUES ('cloud', 'cloud123', '구름이', 120);

SELECT * FROM person;