-- 여름(계절) 학기 테이블 생성
CREATE TABLE summer_class(
    sid   NUMBER,          -- 학번
    subject VARCHAR2(20),  -- 과목
    price NUMBER           -- 수강료
);

INSERT INTO summer_class VALUES (100, 'C', 30000);
INSERT INTO summer_class VALUES (101, 'Java', 45000);
INSERT INTO summer_class VALUES (200, 'Python', 40000);
INSERT INTO summer_class VALUES (201, 'Java', 45000);

COMMIT;

SELECT * FROM summer_class;

-- 계절학기를 듣는 학생의 학번과 수강하는 과목은?
SELECT sid, subject 
FROM summer_class;

-- python 강좌의 수강료는?
SELECT price 
FROM summer_class
WHERE subject = 'Python';

-- 여름 학기를 듣는 학생 수와 수강료 총액은?
SELECT COUNT(*) 학생수, 
       SUM(price) 수강료총액
FROM summer_class;

-- 삭제 이상 --
-- 200번 학생이 수강신청을 취소하여 삭제
DELETE FROM summer_class WHERE sid = 200;

-- -- python 강좌의 수강료는 조회 안됨
SELECT price 
FROM summer_class
WHERE subject = 'Python';

-- 삽입 이상 --
-- C++ 강좌 개설, 수강료는 40000 아직 신청한 학생 없음
INSERT INTO summer_class VALUES (NULL, 'C++', 35000);

-- NULL값이 있는 경우 튜플은 5개이지만 수강학생은 총 4명임
SELECT COUNT(*) 수강인원
FROM summer_class;

SELECT COUNT(sid) 수강인원
FROM summer_class;

SELECT COUNT(*) 수강인원
FROM summer_class
WHERE sid IS NOT NULL;

-- 수정 이상 --
-- Java 강좌 수강료가 45,000원에서 40,000원으로 변경되어 수정함
UPDATE summer_class
SET price = 40000
WHERE subject = 'Java';

SELECT * FROM summer_class;
-- 복구
ROLLBACK;

-- 만약 UPDATE문을 다음과 같이 작성하면 데이터 불일치 문제 발생함
-- 1건만 수정
UPDATE summer_class
SET price = 40000
WHERE subject LIKE 'Java' AND sid = 101;

-- Java 수강료 조회
SELECT price Java수강료
FROM summer_class
WHERE subject LIKE 'Java';

-- 전체 데이터 삭제 : table은 유지
-- ROLLBACK 적용 안됨
TRUNCATE TABLE summer_class;

ROLLBACK;

drop table summer_class;
