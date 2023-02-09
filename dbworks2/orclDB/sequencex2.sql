-- 시퀀스(일련번호) 생성
CREATE SEQUENCE my_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 0
  NOCYCLE;

-- 시퀀스 검색
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG 
FROM USER_SEQUENCES;

-- 시퀀스 수정
ALTER SEQUENCE my_seq
  MAXVALUE 100;


-- memberinfo2 테이블 생성
CREATE TABLE memberinfo2(
  no NUMBER PRIMARY KEY,  --기본키(시퀀스 적용할 칼럼)
  name  VARCHAR2(10) NOT NULL
);

SELECT * FROM memberinfo2;

-- 자료추가 전 테이블의 자료 삭제
DELETE memberinfo2;

INSERT INTO memberinfo2 VALUES (my_seq.nextval, 'steve');
INSERT INTO memberinfo2 VALUES (my_seq.nextval, 'bill');
INSERT INTO memberinfo2 VALUES (my_seq.nextval, 'james');

COMMIT;


