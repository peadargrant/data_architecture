-- table setup
drop table if exists covid;
create table covid (
report_date date not null primary key,
confirmed_cases bigint
);

-- load
\copy covid from 'covid_summary.csv' delimiter ',' csv header;
