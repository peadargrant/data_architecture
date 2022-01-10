-- create table
create table tasks ( id bigserial primary key, description text not null unique, due date , done boolean not null default false ); 

-- get info abouut all tables (incl. new one)
\d

-- get info about tasks table
\d tasks

-- show all contents of tasks table
table tasks ; 

-- inserts
insert into tasks ( description, due ) values ( 'Mow the lawn', '2021-11-11') ; 
table tasks ; 
insert into tasks ( description ) values ( 'Book dentist appointment') ; 
table tasks ; 
insert into tasks ( description ) values ( 'Book dentist appointment') ; 
\d tasks
insert into tasks ( description ) values ( 'Book vet appointment') ; 
insert into tasks ( description ) values ( 'Book hair appointment') ; 
\d tasks
table tasks; 

-- selecting data
select * from tasks where description like 'Book %';

-- delete based on a where clause
delete from tasks where description like 'Book %';
delete from tasks where description like 'Book %';

-- date handling
insert into tasks ( description ) values ( 'Book dentist appointment') ; 
insert into tasks ( description ) values ( 'Book hair appointment') ; 
insert into tasks ( description ) values ( 'Book vet appointment') ; 
table tasks; 
select 20-2; -- use as a calculator
select now();  -- function for current time

select now()::date; -- cast as a date
select now()::date + 7 ; -- add 7 days

-- update using function & check for null
update tasks set due=now()::date+7 where due is null ; 

-- setting not null after table creation
alter table tasks alter column due set not null ; 
insert into tasks ( description ) values ( 'Book car service') ; 

-- alter column to set default value (based on function) 
alter table tasks alter column due set default now()::date+7 ; 

-- alter table to add a column
alter table tasks add column client text ; 

-- where does NULL sort? 
update tasks set client = "mum" where id>7 ; 
update tasks set client = 'mum' where id>7 ; 
table tasks; 
update tasks set client = "me" where id=1 ; 
update tasks set client = 'me' where id=1 ; 
table tasks; 
select * from tasks order by client asc ; 
select * from tasks order by client desc ; 

-- alter table to drop default / not null 
alter table tasks alter column client drop default; 
alter table tasks alter column client drop not null; 

-- how to export history 
\s 'history_2021-11-04-1300.sql'

