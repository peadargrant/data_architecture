
DROP TABLE IF EXISTS modules;
CREATE TABLE modules ( 
       id int primary key,
       code text,
       title text not null,
       long_title text not null,
       field_of_study text not null,
       valid_from text not null,
       status text not null,
       credits numeric not null,
       version numeric not null,
       level int not null
       );

\copy modules from 'modules.csv' delimiter ',' csv header;

