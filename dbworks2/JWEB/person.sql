-- Person 테이블 생성 --
CREATE TABLE person(
    userId  VARCHAR2(10),
    userPw VARCHAR2(8) NOT NULL,
    name  VARCHAR2(20) NOT NULL,
    age   NUMBER(3),
    PRIMARY KEY(userId)
);

INSERT INTO person VALUES ('kimsan', 'k1234567', '김산', 25);

COMMIT;

SELECT * FROM person;

UPDATE person SET age = 27 WHERE name = '이강';

DROP TABLE person;