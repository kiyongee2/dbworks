-- 제1 정규형
-- ENTERTAINER 엔티티 생성
CREATE TABLE entertainer(
    name VARCHAR2(20) PRIMARY KEY,   -- 기본키
    birthday VARCHAR2(10) NOT NULL,  -- yyyy-mm-dd
    agency_code VARCHAR2(5) CONSTRAINT ag_code_uq UNIQUE   -- 고유키
);

CREATE SEQUENCE seq_enter;  -- 자동 순번

-- SITE 엔티티 생성
CREATE TABLE site(
    site VARCHAR2(20),
    name VARCHAR2(20) NOT NULL,
    CONSTRAINT site_fk FOREIGN KEY(name) REFERENCES entertainer(name) 
);

-- AGENCY 엔티티 생성
CREATE TABLE agency(
    agency_name VARCHAR2(50),
    agency_code VARCHAR2(5) NOT NULL,
    CONSTRAINT agency_fk FOREIGN KEY(agency_code) REFERENCES entertainer(agency_code)
);

-- entertainer data 삽입
INSERT INTO entertainer VALUES ('이지은', '1993-05-16', 'A1001');
INSERT INTO entertainer VALUES ('김향기', '2000-08-09', 'B1002');
INSERT INTO entertainer VALUES ('김태형', '1995-12-30', 'B1004');

-- site data 삽입
INSERT INTO site VALUES ('인스타그램', '이지은');
INSERT INTO site VALUES ('페이스북', '이지은');
INSERT INTO site VALUES ('유투브', '이지은');
INSERT INTO site VALUES ('인스타그램', '김향기');
INSERT INTO site VALUES ('트위터', '김향기');

-- agency data 삽입
INSERT INTO agency(agency_code, agency_name) VALUES ('A1001', 'EDAM엔터테인먼트');
INSERT INTO agency(agency_code, agency_name) VALUES ('B1002', '지킴엔터테인먼트');

SELECT * FROM entertainer;
SELECT * FROM site;
SELECT * FROM agency;

DROP TABLE entertainer;
DROP TABLE site;
DROP TABLE agency;
DROP SEQUENCE seq_enter;

COMMIT;