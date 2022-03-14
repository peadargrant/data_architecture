-- data load for regex exercises
-- Peadar Grant

-- re-create table
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
       id bigserial primary key,
       code text not null unique,
       is_flight boolean not null,
       remarks text
);

-- CSV copy
\copy flights from 'flights.csv' csv header ;

