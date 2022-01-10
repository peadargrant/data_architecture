-- Setup & load table for bulk bookstore file

BEGIN;

-- drop table
drop table if exists books;

-- create table to match bookstore.csv

-- Title,Price,ISBN-10,Author,Format,Pages,Publisher,Language,Weight,Dimensions,Case pack,Availability
create table books (
Title text not null,
Price decimal (10,2) not null,
ISBN10 text not null,
Author text not null,
Format text not null,
Pages bigint,
Publisher text not null,
BookLanguage text not null,
Weight text not null,
Dimensions text,
Case_pack text not null,
Availability text not null
);

-- client-side copy
\copy books from 'bookstore.csv' with csv header;

COMMIT;

