-- CASE WHEN
CREATE TABLE CASEWHEN(
    COL1  NUMBER(1)
);

INSERT INTO CASEWHEN VALUES (NULL);
INSERT INTO CASEWHEN VALUES (0);
INSERT INTO CASEWHEN VALUES (NULL);
INSERT INTO CASEWHEN VALUES (0);
INSERT INTO CASEWHEN VALUES (NULL);

SELECT * FROM CASEWHEN;

SELECT 
    CASE 
      WHEN C.COL1 IS NULL THEN -1
      ELSE C.COL1
    END DATA1,
    DECODE(C.COL1, NULL, -1, C.COL1) DATA2
FROM CASEWHEN C;

-- CASE WHEN
CREATE TABLE Mytest(
    CLASS VARCHAR2(1),
    NAME  VARCHAR2(6)
);

INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('A', '����');
INSERT INTO Mytest VALUES ('B', '����');
INSERT INTO Mytest VALUES ('B', '����');
INSERT INTO Mytest VALUES ('C', '����');
INSERT INTO Mytest VALUES ('C', '����');

-- �ݺ� �ο��� ���
SELECT CLASS, COUNT(NAME) "RESULT"
FROM Mytest
GROUP BY CLASS;

-- �ݺ� �ο���(�ߺ� �̸� ����) ���
SELECT CLASS, COUNT(DISTINCT NAME) "RESULT"
FROM Mytest
GROUP BY CLASS;

-- �ݺ� �ο��� - DECODE() ����
SELECT 
    COUNT(DECODE(CLASS, 'A', 1)) AS A,
    COUNT(DECODE(CLASS, 'B', 1)) AS B,
    COUNT(DECODE(CLASS, 'C', 1)) AS C
FROM Mytest;

-- �ݺ� �ο��� - CASE WHEN ~ END
SELECT 
    COUNT(CASE WHEN CLASS='A' THEN 1 
          END) A,
    COUNT(CASE WHEN CLASS='B' THEN 1 
          END) B,
    COUNT(CASE WHEN CLASS='C' THEN 1 
          END) C
FROM Mytest;


