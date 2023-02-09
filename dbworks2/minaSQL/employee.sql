-- 직원 테이블 생성 --
CREATE TABLE employee(
    companyId   NUMBER(4) PRIMARY KEY,
    name        VARCHAR2(20) NOT NULL,
    position    VARCHAR2(20) NOT NULL,
    deptId      NUMBER(3),
    CONSTRAINT FK_DEPTEMPLOYEE FOREIGN KEY(deptId) 
    REFERENCES department(deptId)
);

-- 테스트 자료 추가 --
INSERT INTO employee VALUES (5000, '장그래', '대리', 100);

COMMIT;

SELECT * FROM employee;

DROP TABLE employee;