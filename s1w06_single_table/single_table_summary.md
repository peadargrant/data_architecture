% Single table data summary 

# Documentation

Always refer to the PostgreSQL docs for the version you're using.

https://www.postgresql.org/docs/13/index.html

# Language

General database language vs. relational DB language

relation = table
fields = columns
records = rows

# Good practice

## Column names

name columns correctly: descriptive, short, no spaces (use _)

## Datatypes 

choose datatypes correctly for data of interest
https://www.postgresql.org/docs/13/datatype.html

## UNIQUE constraints

Prevent duplicate rows when should be unique (use unique)
Use UNIQUE if column should be unique. 

## NOT NULL

Whether NULL allowed depends on problem of interest.
Use NOT NULL if not. 

Afterwards:
ALTER TABLE tasks ALTER COLUMN description SET NOT NULL
ALTER TABLE tasks ALTER COLUMN description DROP NOT NULL                                      

## PRIMARY KEY

Primary key is NOT NULL and UNIQUE.
Every table should have 1 primary key.
Cannot have more than 1. 
Use PRIMARY KEY if column is the primary key. 

## Default value

Column can have default value if not specified in INSERT. 

When creating table: 
text not null default 'xyz'

Afterwards:
ALTER TABLE tasks ALTER COLUMN description SET default 'xyz'
ALTER TABLE tasks ALTER COLUMN description DROP default

## Auto-increment

Use BIGSERIAL (or SERIAL) as data type. 
Will create Sequence and default column to next value. 

