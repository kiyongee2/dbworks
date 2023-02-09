-- member 테이블
INSERT INTO member VALUES ('member', 'member12', '회원', 'ROLE_MEMBER', TRUE);
INSERT INTO member VALUES ('manager', 'manager12', '매니저', 'ROLE_MANAGER', TRUE);
INSERT INTO member VALUES ('admin', 'admin12', '어드민', 'ROLE_ADMIN', TRUE);

SELECT * FROM member;
SELECT * FROM board;

DELETE FROM member;