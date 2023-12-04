use javaweb;

select * from board;

select * from t_board order by regdate desc;

select * from t_reply order by rdate desc;

-- 댓글 삭제
delete from t_reply where rno = 4;

-- 검색
-- 게시글 제목이 '충청남도'인 글 검색
select * from t_board where title like '충청남도';

-- 게시글 제목이 '충청'을 포함하는 글 검색
select * from t_board where title like '%충청%';

-- 게시글 제목이 '충청'을 포함하는 글에 글번호를 내림차순으로 검색
select * from t_board where title like '%충청%'
order by bnum desc;

-- 게시글 작성자가 'today'인 글 검색
select * from t_board where memberid like 'today';

-- 게시글 전체에서 1행부터 10개 검색
select * from t_board order by bnum limit 0, 10;  

-- 검색된 게시글 중 3번 행부터 5개 검색
select * from t_board where title like '%충청%'
order by bnum limit 2, 5;   




