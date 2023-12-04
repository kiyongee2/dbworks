-- users 테이블 생성
CREATE TABLE users(
    id       NUMBER(5) PRIMARY KEY,
    username VARCHAR2(30),
    password VARCHAR2(100),
    email    VARCHAR2(30)
);

INSERT INTO users(id, username, password, email) 
VALUES (1, 'guest', '1234', 'guest@gmail.com');

SELECT * FROM users;