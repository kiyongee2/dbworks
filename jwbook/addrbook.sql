-- addrbook ���̺� ����
CREATE TABLE addrbook(
    num       NUMBER PRIMARY KEY,
    username  VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20), 
    email     VARCHAR2(30) NOT NULL UNIQUE,
    gender    VARCHAR2(6),
    regdate   TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE SEQUENCE seq_num NOCACHE;

INSERT INTO addrbook(num, username, tel, email, gender)
VALUES (seq_num.NEXTVAL, '����', '010-1234-5678', 'test@gmail.com', '��');

INSERT INTO addrbook(num, username, tel, email, gender)
VALUES (seq_num.NEXTVAL, '����', '010-1234-5678', 'test@gmail.com', '��');

COMMIT;

SELECT * FROM addrbook;

DROP TABLE addrbook;
DROP SEQUENCE seq_num;



