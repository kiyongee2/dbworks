-- user: bloguser, blog
create user 'bloguser'@'%' identified by 'bloguser';

grant all privileges on *.* to 'bloguser'@'%';

create database blog;


