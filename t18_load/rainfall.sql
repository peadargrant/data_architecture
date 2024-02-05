-- drop & recreate the database
drop database if exists rainfall;
create database rainfall;

-- change to the rainfall database
\c rainfall

-- creating the table
drop table if exists rainfall;
create table rainfall (
       east int not null,
       north int not null,
       year int not null,
       month int not null,
       rainfall numeric not null
);
