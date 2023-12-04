use javaweb;
show tables;

-- 회원 테이블
create table t_member(
	memberid	varchar(20),
    passwd		varchar(20) not null,
    name		varchar(30) not null,
    gender		varchar(10),
    joindate	timestamp default now(),
    primary key(memberId)
);

-- 게시판 테이블
create table t_board(
	bnum	int primary key auto_increment,
    title	varchar(100) not null,
    content text,
    regdate timestamp default now(),
    modifydate timestamp,
    hit		int default 0,
    memberid varchar(20),
    fileupload varchar(50),
    constraint fk_member_board foreign key (memberid)
    references t_member(memberid) on delete cascade
);
alter table board add reply_count int DEFAULT '0';

-- 댓글 테이블
create table t_reply(
	rno int primary key auto_increment,
    bnum int not null,
    rcontent text not null,
    replyer varchar(30) not null,
    rdate timestamp default now(),
    rupdate timestamp,
    constraint fk_reply_board foreign key(bnum)
    references t_board(bnum)
);

-- 회원 추가
insert into t_member (memberid, passwd, name, gender)
values ('cloud', 'm123456#', '김기용', '남자');

-- 게시글 추가
insert into t_board (title, content, memberid)
values ('제목입니다.', '글 내용입니다.', 'ansan');

-- 댓글 추가
insert into t_reply(bnum, rcontent, replyer)
values(1, '내용에 대한 댓글입니다.', 'ansan');

-- 검색 
select * from t_member;
select * from t_board order by regdate desc;
select * from t_reply order by rdate desc;

-- 댓글 삭제
delete from t_board where bnum = 2;

-- 댓글 수정
update t_reply set rcontent='chat GPT' where rno = 26;

SELECT COUNT(*) FROM t_member WHERE memberid = 'ansan';

SELECT * FROM t_board ORDER BY bnum DESC LIMIT 1, 5;

commit;

-- 게시글 총 개수
select count(*) total from t_board;

-- 게시글 행 번호로 추출하기
select * from t_board limit 0, 5;

select * from t_board order by bnum desc limit 3, 10;

-- 댓글 수 업데이트
select count(*) from t_reply;

-- update board b
-- set b.reply_count = 




