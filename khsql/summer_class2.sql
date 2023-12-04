-- summer_price, summer_register 테이블 생성
CREATE TABLE summer_price(
    subject VARCHAR2(20),
    price   NUMBER
);

INSERT INTO summer_price VALUES ('C', 30000);
INSERT INTO summer_price VALUES ('Java', 45000);
INSERT INTO summer_price VALUES ('Python', 40000);

CREATE TABLE summer_register(
    sid     NUMBER,
    subject VARCHAR2(20)
);

INSERT INTO summer_register VALUES (100, 'C');
INSERT INTO summer_register VALUES (101, 'Java');
INSERT INTO summer_register VALUES (200, 'Python');
INSERT INTO summer_register VALUES (201, 'Java');

SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- 계절 학기를 듣는 학생의 학번과 수강하는 과목은?
SELECT sid, subject 
FROM summer_register;

-- Python 강좌의 수강료는?
SELECT price
FROM summer_price
WHERE subject = 'Python';

-- 수강료가 가장 비싼 과목은?
SELECT subject
FROM summer_price
WHERE price = (SELECT MAX(price) FROM summer_price);

-- 계절학기를 듣는 총 학생수와 수강료 총액은?
SELECT COUNT(*) 총학생수, SUM(price) 수강료총액
FROM summer_price;

-- 삭제 이상 없음
-- 200번 학생의 수강 신청을 취소하시오
DELETE FROM summer_register 
WHERE sid = 200;

-- Python 과목의 수강료는?
SELECT price Python수강료
FROM summer_price
WHERE subject = 'Python';

-- 삽입이상 없음
-- C++ 강좌와 수강료 35,000원 삽입
INSERT INTO summer_price VALUES ('C++', 35000);

-- 수강 신청 정보 확인
SELECT * FROM summer_price;

-- 수정이상 없음
-- Java 과목의 수강료를 45,000원에서 40,000원으로 변경
UPDATE summer_price
SET price = 40000
WHERE subject = 'Java';

SELECT price Java수강료
FROM summer_price
WHERE subject = 'Java';


DROP TABLE summer_price;