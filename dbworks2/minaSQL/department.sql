-- 부서 테이블 생성 --
CREATE TABLE department(
    deptId      NUMBER(3) PRIMARY KEY,
    deptName    VARCHAR2(20),
    location    VARCHAR2(20)
);

-- 테이블 테스트 데이터 추가 --
INSERT INTO department VALUES (100, '관리부', '서울');

-- 추가후 커밋-
COMMIT;

SELECT * FROM department;