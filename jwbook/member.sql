CREATE TABLE member(
    mno    INT,
    id     VARCHAR2(20) UNIQUE,
    passwd VARCHAR2(20) NOT NULL,
    name   VARCHAR2(30) NOT NULL,
    email  VARCHAR2(50),
    gender VARCHAR2(6),
    joindate TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(mno)
);
CREATE SEQUENCE seq_mno NOCACHE;

INSERT INTO member (mno, id, passwd, name, email, gender)
VALUES (seq_mno.NEXTVAL, 'khit', 'm123456', '±è±â¿ë', 'khit@naver.com', '³²');

SELECT * FROM member;

SELECT DECODE(count(*), 1, 'true', 'false') as result
FROM member WHERE id = 'khit';

COMMIT;

SELECT * FROM member;

DROP TABLE member;
DROP SEQUENCE seq_mno;

