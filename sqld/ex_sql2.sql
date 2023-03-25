-- 계층형 쿼리 --
CREATE TABLE TAB1(
    C1 VARCHAR2(1),
    C2 VARCHAR2(1),
    C3 VARCHAR2(1)
);

INSERT INTO TAB1 VALUES('1', NULL, 'A');
INSERT INTO TAB1 VALUES(2, 1, 'B');
INSERT INTO TAB1 VALUES(3, 1, 'C');
INSERT INTO TAB1 VALUES(4, 2, 'D');

1 NULL	A
2 1 B
4 2 D
3 1 C

SELECT * 
    FROM TAB1
   START WITH C2 IS NULL
   CONNECT BY PRIOR C1 = C2
   ORDER SIBLINGS BY C3 DESC;

/* 문제2 */
CREATE TABLE 사원(
    사원번호 VARCHAR(3),
    사원명 VARCHAR(10),
    입사일자 VARCHAR(10),
    매니저사원번호 VARCHAR(3),
    CONSTRAINT 사원_PK PRIMARY KEY (사원번호),
    CONSTRAINT 사원_FK FOREIGN KEY (매니저사원번호)
    REFERENCES 사원(사원번호)
);

INSERT INTO 사원 VALUES ('001', '홍길동', '2012-01-01', NULL);
INSERT INTO 사원 VALUES ('002', '강감찬', '2012-01-01', '001');
INSERT INTO 사원 VALUES ('003', '이순신', '2013-01-01', '001');
INSERT INTO 사원 VALUES ('004', '이민정', '2013-01-01', '001');
INSERT INTO 사원 VALUES ('005', '이병헌', '2013-01-01', NULL);
INSERT INTO 사원 VALUES ('006', '안성기', '2014-01-01', '005');
INSERT INTO 사원 VALUES ('007', '이수근', '2014-01-01', '005');
INSERT INTO 사원 VALUES ('008', '김병만', '2014-01-01', '005');

SELECT *
    FROM 사원
    START WITH 매니저사원번호 IS NULL
    CONNECT BY PRIOR 사원번호 = 매니저사원번호
    AND 입사일자 BETWEEN '2013-01-01' AND '2013-12-31'
    ORDER SIBLINGS BY 사원번호;
    

ROLLBACK;
DELETE FROM 사원;

/* 문제3 */
CREATE TABLE 부서(
    부서코드 VARCHAR2(3),
    부서명  VARCHAR2(20),
    상위부서코드 VARCHAR2(3),
    CONSTRAINT 부서_PK PRIMARY KEY (부서코드),
    CONSTRAINT 부서_FK FOREIGN KEY (상위부서코드) REFERENCES 부서(부서코드)
);

INSERT INTO 부서 VALUES ('100', '아시아부', NULL);
INSERT INTO 부서 VALUES ('110', '한국지사', 100);
INSERT INTO 부서 VALUES ('111', '서울지점', 110);
INSERT INTO 부서 VALUES ('112', '부산지점', 110);
INSERT INTO 부서 VALUES ('120', '일본지사', 100);
INSERT INTO 부서 VALUES ('121', '도쿄지점', 120);
INSERT INTO 부서 VALUES ('122', '오사카지점', 120);
INSERT INTO 부서 VALUES ('130', '중국지사', 100);
INSERT INTO 부서 VALUES ('131', '베이징지점', 130);
INSERT INTO 부서 VALUES ('132', '상하이지점', 130);
INSERT INTO 부서 VALUES ('200', '남유럽지부', NULL);
INSERT INTO 부서 VALUES ('210', '스페인지사', 200);
INSERT INTO 부서 VALUES ('211', '마드리드지점', 210);
INSERT INTO 부서 VALUES ('212', '그라나다지점', 210);




SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 상위부서코드 = 부서코드
UNION  
SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 부서코드 = 상위부서코드;









   
   
   
    