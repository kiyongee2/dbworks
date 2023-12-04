-- user: bootuser, springdb
create user 'bootuser'@'%' identified by 'bootuser';

grant all privileges on *.* to 'bootuser'@'%';

create database springdb;

use springdb;

