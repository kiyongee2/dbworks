-- ex2_8 테이블 생성 --
CREATE TABLE ex2_8(
    col1    VARCHAR2(10) PRIMARY KEY,
    col2    VARCHAR2(10)
);

-- 기본키는 NOT NULL이므로 NULL 입력 불가
INSERT INTO ex2_8 VALUES ('', 'AA');

INSERT INTO ex2_8 VALUES ('aa', 'aa');

-- 무결성 제약 조건 위배
INSERT INTO ex2_8 VALUES ('aa', 'aa');

DELETE ex2_8;