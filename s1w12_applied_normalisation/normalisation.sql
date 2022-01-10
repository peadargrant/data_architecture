-- Normalising an existing dataset
-- Ideas for normalising an existing dataset assuming its imported.
-- Must consider if assumptions around an existing dataset might apply to future data.

-- NOT NULL
--Easiest way to see if a column can have a NOT NULL constraint applied is to attempt to set it:

ALTER TABLE table ALTER COLUMN column SET NOT NULL ; 

--  UNIQUE
-- Easiest way to see if column(s) UNIQUE is to try to set a UNIQUE constraint:
ALTER TABLE table ADD UNIQUE ( column );
ALTER TABLE table ADD UNIQUE ( column1, column2 );


-- ID column
-- Often may want an auto-incrementing column to be added to serve as primary key.
-- Also enables 2NF directly if in 1NF.
-- Shown with PRIMARY KEY specifier on as usually would be:
ALTER TABLE table ADD COLUMN id bigserial primary key ; 


-- Comma-separated / multi-valued
-- Can be tricky to do entirely in-database, but manageable.
-- Postgres array can be helpful here.

-- How many authors?
select max(array_length(string_to_array(author,','),1)) from books ;

-- Unnest is a handy function to flatten this: 
select isbn10, unnest(string_to_array(author,', ')) from books ;

-- Put author names in a table
drop table if exists author;
create table author ( id bigserial primary key, name text not null unique ) ; 
insert into author (name) select distinct unnest(string_to_array(author,', ')) from books ;

-- Mapping
drop table if exists book_author;
create table book_author ( id bigserial primary key, book bigint not null references books, author bigint not null references author, unique(book,author));
insert into book_author ( book, author ) select t1.book_id, author.id as author_id from ( select books.id as book_id, unnest(string_to_array(books.author,', ')) as author_name from books order by book_id asc ) as t1 join author on author.name=t1.author_name on conflict do nothing ;
alter table book drop column author;


