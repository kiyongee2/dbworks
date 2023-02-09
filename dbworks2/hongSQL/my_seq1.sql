-- 시퀀스 --
CREATE SEQUENCE mySeq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

-- 1부터 시작해서 1씩 증가하며 최소값 1 부터 
-- 최대값 1000까지 순번을 자동생성한다.

-- 기존 데이터는 지운다.
DELETE ex2_8;

-- 데이터 입력
INSERT INTO ex2_8 (col1, col2) VALUES (mySeq.NEXTVAL, 'cat');

INSERT INTO ex2_8 (col1, col2) VALUES (mySeq.NEXTVAL, 'dog');

INSERT INTO ex2_8 (col1, col2) VALUES (mySeq.NEXTVAL, 'cow');

SELECT * FROM ex2_8;

-- 시퀀스 삭제 --
DROP SEQUENCE mySeq;

COMMIT;

