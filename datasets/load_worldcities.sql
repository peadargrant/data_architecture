-- World cities load script
-- Peadar Grant
-- Run this using
-- psql -f load_worldcities.sql
-- from this folder!

drop table if exists cities;

create table cities (

       city text,
       city_ascii text,
       lat numeric,
       lng numeric,
       country text,
       iso2 text,
       iso3 text,
       admin_name text,
       capital text,
       population numeric,
       id int

);

-- client-side copy
\copy cities from 'worldcities.csv' with ( format csv, header, delimiter ',', force_null (population) ) ;
-- force null needed to coerce empty strings to null

