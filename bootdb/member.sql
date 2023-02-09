
SELECT * FROM board;

SELECT * FROM member;

DELETE FROM member WHERE id='cloud';

-- 관리자 권한 부여
UPDATE member SET role = 'ROLE_ADMIN' WHERE id = 'admin';

SELECT VERSION();

DROP TABLE board;

DROP TABLE member;



