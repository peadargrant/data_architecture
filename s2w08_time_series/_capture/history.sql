select * from covid ; 
select (*) from covid ; 
\d covid
select max(confirmed_cases) from covid ; 
select max(confirmed_cases) from covid ; 
select * from covid where confirmed_cases=26122;
select min(confirmed_cases) from covid ; 
select sum(confirmed_cases) from covid ; 
select sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases) from covid ; 
select sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), average(confirmed_cases) from covid ; 
select sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid ; 
alter table covid add column year int ; 
update covid set year=extract( year FROM date )::int;
\d covid
update covid set year=extract( year FROM report_date )::int;
table covid; 
select sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid ; 
select year, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid group by year; 
select year, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid group by year order by year asc ; 
alter table covid add column month int ; 
update covid set month=extract( month FROM report_date )::int;
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid group by year, month order by year asc ; 
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid group by year, month order by year asc month asc; 
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid group by year, month order by year asc, month asc; 
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) as avg_cases from covid group by year, month having avg_cases>500 order by year asc, month asc; 
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) as avg_cases from covid group by year, month having order by year asc, month asc; 
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) as avg_cases from covid group by year, month order by year asc, month asc; 
select year, month, sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) as avg_cases from covid group by year, month having avg(confirmed_cases)>500  order by year asc, month asc; 
select report_date, confirmed_cases from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc ) from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc ) as total_confirmed_cases from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( ) as total_confirmed_cases from covid order by report_date asc limit 20 ; 
select sum(confirmed_cases), min(confirmed_cases), max(confirmed_cases), avg(confirmed_cases) from covid ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( ) as total_confirmed_cases from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by confirmed_cases asc ) as total_confirmed_cases from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc ) as total_confirmed_cases from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc between 1 preceding and current row ) as last2days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc rows between 1 preceding and current row ) as last2days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc rows between 6 preceding and current row ) as last2days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc rows between 6 preceding and current row ) as last6days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, sum(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as last6days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, avg(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as last6days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, cast(avg(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as int) as last6days from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, cast(avg(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as int) as last6daysavg, avg(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as last6dayssum from covid order by report_date asc limit 20 ; 
select report_date, confirmed_cases, cast(avg(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as int) as last6daysavg, sum(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as last6dayssum from covid order by report_date asc limit 20 ; 
\e
select report_date, confirmed_cases, cast(avg(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as int) as last6daysavg, sum(confirmed_cases) over ( order by report_date asc rows between 7 preceding and 1 preceding ) as last6dayssum from covid order by report_date asc limit 20 ;
select report_date, confirmed_cases, cast(avg(confirmed_cases) over prev6days as int) as moving_avg, sum(confirmed_cases) over prev6days as moving_sum from covid window prev6days as (order by report_date asc rows between 7 preceding and 1 preceding ) order by report_date asc ; 
select report_date, confirmed_cases, cast(avg(confirmed_cases) over prev6days as int) as moving_avg, sum(confirmed_cases) over prev6days as moving_sum, sum(confirmed_cases) over all_previous as total_to_date from covid window prev6days as (order by report_date asc rows between 7 preceding and 1 preceding ) window total_to_date as (order by report_date asc) order by report_date asc ; 
select report_date, confirmed_cases, cast(avg(confirmed_cases) over prev6days as int) as moving_avg, sum(confirmed_cases) over prev6days as moving_sum, sum(confirmed_cases) over all_previous as total_to_date from covid window prev6days as (order by report_date asc rows between 7 preceding and 1 preceding ), total_to_date as (order by report_date asc) order by report_date asc ; 
select report_date, confirmed_cases, cast(avg(confirmed_cases) over prev6days as int) as moving_avg, sum(confirmed_cases) over prev6days as moving_sum, sum(confirmed_cases) over all_previous as total_to_date from covid window prev6days as (order by report_date asc rows between 7 preceding and 1 preceding ), all_previous as (order by report_date asc) order by report_date asc ; 
\q
\h
\?
\?
\s history.sql
