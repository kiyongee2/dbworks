-- COUNT(NVL())
CREATE TABLE K1(
    ID VARCHAR2(3),
    CNT NUMBER(2)
);

INSERT INTO K1 VALUES ('가', 5);
INSERT INTO K1 VALUES ('나', NULL);
INSERT INTO K1 VALUES ('다', 5);
INSERT INTO K1 VALUES ('라', NULL);
INSERT INTO K1 VALUES ('마', 10);

SELECT COUNT(NVL(CNT, 0)) FROM K1;  -- 5
SELECT SUM(NVL(CNT, 0)) / 4 FROM K1;  --5
SELECT AVG(NVL(CNT, 0)) FROM K1; --4
SELECT MIN(NVL(CNT, 5)) FROM K1; --5

-- CASE WHEN
CREATE TABLE Mytest(
    CLASS VARCHAR2(1),
    NAME VARCHAR2(6)
);

INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('A', '조조');
INSERT INTO Mytest VALUES ('B', '유비');
INSERT INTO Mytest VALUES ('B', '관우');
INSERT INTO Mytest VALUES ('C', '여포');
INSERT INTO Mytest VALUES ('C', '여포');

SELECT * FROM MYtest;

SELECT CLASS, COUNT(NAME) "RESULT"
FROM Mytest
GROUP BY CLASS;

SELECT CLASS, COUNT(DISTINCT NAME) "RESULT"
FROM Mytest
GROUP BY CLASS;

SELECT 
COUNT(CASE WHEN CLASS='A' THEN 1 
      END) AS A,
COUNT(CASE WHEN CLASS='B' THEN 1 
      END) AS B,
COUNT(CASE WHEN CLASS='C' THEN 1 
      END) AS C
FROM Mytest;

-- CASE WHEN 2
CREATE TABLE TEST(
    COL1 NUMBER(1)
);

INSERT INTO TEST VALUES (NULL);
INSERT INTO TEST VALUES (0);
INSERT INTO TEST VALUES (NULL);
INSERT INTO TEST VALUES (0);
INSERT INTO TEST VALUES (NULL);

SELECT * FROM TEST;

SELECT 
    CASE WHEN T.COL1 IS NULL THEN -1
         ELSE 0
    END AS DATA,
    DECODE(T.COL1, NULL, -1, T.COL1) AS DATA2
FROM TEST T;







