-- 테이블 복사하기 --
CREATE TABLE member2 AS SELECT * FROM t_member;

SELECT * FROM member2;

-- 칼럼열 별칭 사용하기 --
SELECT id AS 아이디, pwd AS 패스워드 FROM member2;

-- 이름과 이메일 연결하기 --
SELECT id, pwd, name || '-' || email AS 회원정보 FROM member2;ㄴ

-- 중복값 제거하기 --
SELECT DISTINCT id, pwd FROM member2;

