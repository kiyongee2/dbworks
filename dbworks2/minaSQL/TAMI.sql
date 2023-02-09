-- 테이블 생성 TEST
CREATE TABLE TEST (
    SEQ NUMBER(1)
);

-- 테이블 생성
CREATE TABLE TAMI_MEMBER(
    SEQ     NUMBER(3),
    NAME    VARCHAR(20),
    POSITION    VARCHAR(100),
    FINAL_YN    VARCHAR(1)
);

SELECT VSIZE('ABC') FROM DUAL;

SELECT VSIZE('가나다') FROM DUAL;
-- 영어 1바이트, 한글 2바이트

INSERT INTO tami_member VALUES (1, '아일', 'vocal', 'y');

SELECT * FROM tami_member;