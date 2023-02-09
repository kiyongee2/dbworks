-- t_member 테이블 생성 --
CREATE TABLE t_member(
    id  VARCHAR2(10) PRIMARY KEY,
    pwd VARCHAR2(10) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    email VARCHAR2(50),
    joinDate DATE DEFAULT SYSDATE
);

SELECT * FROM t_member ORDER BY joinDate;

-- 회원 추가--
INSERT INTO t_member 
VALUES ('hong', '1001', '홍길동', 'hong@gmail.com', sysdate);

INSERT INTO t_member 
VALUES ('lee', '1002', '이순신', 'lee@naver.com', sysdate);

INSERT INTO t_member 
VALUES ('kim', '2001', '김유신', 'kang@daum.com', sysdate);

COMMIT;
