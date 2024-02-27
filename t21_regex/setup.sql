-- data load for regex exercises
-- Peadar Grant

BEGIN;

DROP TABLE IF EXISTS regexdata;
DROP TYPE IF EXISTS code_type;

-- type
CREATE TYPE code_type AS ENUM ('invalid', 'card', 'flight','bus','phone','ip');

-- re-create table
CREATE TABLE regexdata (
       code text not null unique,
       code_type code_type not null,
       remarks text
);

-- CSV copy
\copy regexdata from 'regex_data.csv' csv header ;

COMMIT;
