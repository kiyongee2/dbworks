-- decode() 함수
SELECT * FROM t_member;

SELECT count(*) 전체회원수
FROM t_member;

SELECT count(memberId) 아이디개수
FROM t_member WHERE memberId = 'garlic';

SELECT count(memberId) result
FROM t_member WHERE memberId = 'garlic2';

-- memberId가 'garlic'이면 'true' 아니면 'fals' 출력
SELECT memberId, passwd, 
       decode(memberId, 'garlic', 'true', 'false') as result
FROM t_member;

-- memberId가 'garlic2'의 개수가 1이면 'true' 아니면 'false' 출력
SELECT decode(count(*), 1, 'true', 'false') as result
FROM t_member WHERE memberId = 'garlic2';
