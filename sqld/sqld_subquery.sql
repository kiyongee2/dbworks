CREATE TABLE 프로그램 (
	프로그램ID		VARCHAR(6),
	프로그램명		VARCHAR(30),
	감독			VARCHAR(10),
	작가			VARCHAR(20)
);


CREATE TABLE 프로그램편성 (
	편성ID		VARCHAR(3),	
	프로그램ID		VARCHAR(6),
	방송매체ID		VARCHAR(1),
	방송시작일자	DATE,
	방송종료일자	DATE
);

CREATE TABLE 방송매체 (
	방송매체ID		VARCHAR(1),
	방송매체명		VARCHAR(20)
);

INSERT INTO 프로그램 VALUES('T00001','유퀴즈','김민석','이언주');
INSERT INTO 프로그램 VALUES('J00001','슬기로운 의사생활','신원호','이우');
INSERT INTO 프로그램 VALUES('M00002','라디오스타','강성아','박현정');
INSERT INTO 프로그램 VALUES('S00001','그 해 우리는','김윤진','이나은');
INSERT INTO 프로그램 VALUES('N00001','오징어게임','황동혁','황동혁');
INSERT INTO 프로그램 VALUES('T00002','나의 아저씨','김원석','박해영');

INSERT INTO 프로그램편성 VALUES('001','T00001','T','20180829','29991231');
INSERT INTO 프로그램편성 VALUES('002','J00001','J','20210617','20210916');
INSERT INTO 프로그램편성 VALUES('003','M00002','M','20070530','29991231');
INSERT INTO 프로그램편성 VALUES('004','S00001','S','20211206','20220125');
INSERT INTO 프로그램편성 VALUES('005','N00001','N','20210917','29991231');
INSERT INTO 프로그램편성 VALUES('006','T00002','T','20180321','20180517');

INSERT INTO 방송매체 VALUES('T','tvn');
INSERT INTO 방송매체 VALUES('J','jtbc');
INSERT INTO 방송매체 VALUES('M','mbc');
INSERT INTO 방송매체 VALUES('K','kbs');
INSERT INTO 방송매체 VALUES('S','sbs');
INSERT INTO 방송매체 VALUES('N','netflix');

COMMIT;


SELECT B.프로그램명,
	   C.방송매체명,
	   A.방송시작일자,
	   A.방송종료일자
  FROM (SELECT 프로그램ID, 방송매체ID, 방송시작일자, 방송종료일자 
  		  FROM 프로그램편성) A,
  	   프로그램 B, 방송매체 C
 WHERE A.프로그램ID = B.프로그램ID 
   AND A.방송매체ID = C.방송매체ID;

SELECT B.프로그램명,
	   C.방송매체명,
	   A.방송시작일자,
	   A.방송종료일자
  FROM (SELECT 프로그램ID, 방송매체ID 
  		  FROM 프로그램편성
		 WHERE SYSDATE BETWEEN 방송시작일자 AND 방송종료일자) A,
  	   프로그램 B, 방송매체 C
 WHERE A.프로그램ID = B.프로그램ID 
   AND A.방송매체ID = C.방송매체ID;
  
SELECT B.프로그램명,
	   C.방송매체명,
	   A.방송시작일자,
	   A.방송종료일자
  FROM (SELECT 프로그램ID, 방송매체ID, 방송시작일자, 방송종료일자
		  FROM 프로그램편성
		 WHERE SYSDATE BETWEEN 방송시작일자 AND 방송종료일자) A,
  	   프로그램 B, 방송매체 C
 WHERE A.프로그램ID = B.프로그램ID 
   AND A.방송매체ID = C.방송매체ID;
  
SELECT B.프로그램명,
	   C.방송매체명,
	   A.방송시작일자,
	   A.방송종료일자
  FROM (SELECT 프로그램ID, 방송매체ID, 방송시작일자, 방송종료일자 
  		  FROM 프로그램편성
		 WHERE SYSDATE BETWEEN 방송시작일자 AND 방송종료일자 
		   AND 프로그램ID = B.프로그램ID
		   AND 방송매체ID = C.방송매체ID) A,
  	   프로그램 B, 방송매체 C
 WHERE A.프로그램ID = B.프로그램ID 
   AND A.방송매체ID = C.방송매체ID;  