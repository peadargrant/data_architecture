-- drop & recreate the database
drop database if exists stations;
create database stations;

-- change to the stations database
\c stations

-- creating the table
drop table if exists stations;
create table stations (
       id text primary key,
       locationX numeric not null,
       locationY numeric not null,
       standardname text not null unique,
       name text not null unique
);
