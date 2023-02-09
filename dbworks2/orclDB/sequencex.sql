-- 시퀀스(일련번호) 생성
CREATE SEQUENCE no_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;
  
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG 
FROM USER_SEQUENCES;

-- MEMBERINFO 테이블 생성
CREATE TABLE memberinfo(
  no NUMBER PRIMARY KEY,  --기본키(시퀀스 적용할 칼럼)
  name  VARCHAR2(10) NOT NULL,
  phonenumber  VARCHAR2(20) NOT NULL
);

-- 데이터 추가
INSERT INTO memberinfo VALUES (no_seq.nextval, 'steve', '01011112222');
INSERT INTO memberinfo VALUES (no_seq.nextval, 'bill', '01011113333');
INSERT INTO memberinfo VALUES (no_seq.nextval, 'jeff', '01011112222');

SELECT * FROM memberinfo;

DELETE memberinfo;

INSERT INTO memberinfo VALUES (no_seq.nextval, 'steve', '01011112222');

SELECT no_seq.CURRVAL FROM DUAL;

COMMIT;








