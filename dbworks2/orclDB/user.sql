-- users 테이블 생성
CREATE TABLE users(
    userID    varchar2(20) primary key,
    userPW    varchar2(10)
);
DESC users;

SELECT * FROM users;

-- name 칼럼 추가
ALTER TABLE users ADD(name varchar(20)); 

-- 가입일 칼럼 추가
ALTER TABLE users ADD(joinDate Date);

-- 테이블 전체 자료 삭제
DELETE FROM users;

-- 회원 추가
INSERT INTO users VALUES('giyong', '1234', '김기용', SYSDATE);
INSERT INTO users VALUES('admin', '1111', '김기민', SYSDATE);

COMMIT;
