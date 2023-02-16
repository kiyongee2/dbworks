-- sample 엔티티
CREATE TABLE sample(
    col1 NUMBER,
    col2 NUMBER
);

CREATE TABLE sample2(
    str1 VARCHAR2(20),
    str2 VARCHAR2(20)
);

CREATE TABLE sample3(
    col1 NUMBER,
    col2 NUMBER,
    col3 NUMBER
);

-- sample 데이터 추가
INSERT INTO sample(col1, col2) VALUES (10, 5);
INSERT INTO sample(col1) VALUES (20);
INSERT INTO sample(col2) VALUES (15);

-- sample2 데이터 추가
INSERT INTO sample2 VALUES ('나는', '합격한다.');

-- sample3 데이터 추가
INSERT INTO sample3(col1, col2, col3) VALUES (NULL, 30, 15);
INSERT INTO sample3(col1, col2, col3) VALUES (25, NULL, 0);
INSERT INTO sample3(col1, col2, col3) VALUES (65, 20, NULL);

SELECT SUM(col1), SUM(col2) FROM sample WHERE col2 > 5;
SELECT SUM(col1), SUM(col2) FROM sample WHERE col2 IS NOT NULL;
-- NULL이 포함되어 있으면 결과값이 NULL이 됨
SELECT col1 + col2 AS result FROM sample;

SELECT * FROM sample;

-- 문자 연결
SELECT str1 || ' ' || 'SQLD' || ' ' || str2 AS result
FROM sample2;

-- 문자 함수
SELECT CHR(65) FROM dual;
SELECT LTRIM('   JENNIE') FROM dual;
SELECT LTRIM('블랙핑크', '블랙') FROM dual; --핑크
SELECT RTRIM('블랙핑크', '핑크') FROM dual; --블랙
SELECT SUBSTR('블랙핑크제니', 3, 4) FROM dual; --핑크제니
SELECT REPLACE('블랙핑크제니', '제니', '지수') FROM dual; --블랙핑크지수

-- 집계 함수
SELECT AVG(col1) result1,
       SUM(col2) result2,
       COUNT(col3) result3
FROM sample3;

COMMIT;





