-- person 테이블 생성
CREATE TABLE person(
    userId    VARCHAR2(10) PRIMARY KEY,
    userPw    VARCHAR2(10) NOT NULL,
    name      VARCHAR2(20) NOT NULL,
    age       NUMBER(3)
);

ALTER TABLE person DROP COLUMN regDate;

ALTER TABLE person ADD regDate DATE;

-- 자료 삽입
INSERT INTO person(userId, userPw, name, age, regDate) 
VALUES ('sky1', 'cloud123', '구름이', 120, TO_DATE('2022-06-09', 'YYYY-MM-DD'));

-- 커밋 완료
COMMIT;

SELECT * FROM person;

SELECT userId, userpw, name, age,
    TO_CHAR(regDate, 'yyyy-mm-dd') regDate
FROM person;