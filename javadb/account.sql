CREATE TABLE account(
    ano VARCHAR2(10) PRIMARY KEY,
    owner VARCHAR2(20) NOT NULL,
    balance NUMBER(10) NOT NULL
);

INSERT INTO account(ano, owner, balance) VALUES ('101', '±è±â¿ë', 100);

SELECT * FROM account;
