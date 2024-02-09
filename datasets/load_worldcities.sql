drop table if exists cities;

create table cities (

       city text not null,
       city_ascii text not null,
       lat float not null,
       lng float not null,
       country text not null,
       iso2 text not null,
       iso3 text not null,
       admin_name text not null,
       capital text not null,
       population numeric,
       id int not null primary key

);

\COPY cities FROM 'worldcities.csv' WITH ( FORMAT CSV, DELIMITER ',', HEADER, FORCE_NULL(population));

COMMENT ON TABLE cities IS 'Data from worldcities.csv at https://simplemaps.com/data/world-cities';

