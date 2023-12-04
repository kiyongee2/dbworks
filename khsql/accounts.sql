create table account (
  ano     varchar(20) primary key,
  owner   varchar(20) not null,
  balance number      not null
);

insert into account (ano, owner, balance) 
values ('11-111-1111', 'ÇÏ¿©¸§', 1000000);

commit;

select * from account;

DROP TABLE accounts;