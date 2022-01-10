Recommended reading
===================

1.  Connolly & Begg Chapters 4,5

2.  PostgreSQL manual chapters as identified in this document.

Relational model
================

Relational model is based on mathematical concept of a relation. DBMS
applies this as a table.

Relation:

:   a **table** with rows and columns. Logically must appear to user in
    this form. Physical storage on disk may differ.

Attribute:

:   named **column** of a relation

Domain:

:   set of **allowable values** for one or more attributes

Tuple:

:   **row** of a relation. Also called **record**.

Degree

:   of a relation is the number of attributes that it contains.

Cardinality:

:   of a relation is the **number of tuples** that it contains.

Foreign keys
============

[Foreign
keys](https://www.postgresql.org/docs/13/ddl-constraints.html#DDL-CONSTRAINTS-FK)
require that values in a column (or a group of columns) must match the
values appearing in some row of another table. This maintains the
referential integrity.

``` {.postgresql}
/* each employee must be in a valid department */

CREATE TABLE department (
id bigserial primary key,
name text not null unique
/* other fields as required */
);

CREATE TABLE employee (
id bigserial primary key,
surname text not null,
firstname text not null,
department bigint not null REFERENCES department
/* other fields as required */
)
```

DELETE / UPDATE behaviour
-------------------------

Possible behaviours: NO ACTION, CASCADE, SET NULL.

``` {.postgresql}
CREATE TABLE product ( 
/* other fields */

department bigint references departments, 
/* NO ACTION is the default, prohibits conflicting delete */

supplier bigint references suppliers ON DELETE CASCADE,
/* DELETE in suppliers deletes linked products */

policy bigint references policies ON DELETE SET NULL,
/* SETS product.policy to NULL when row in policies deleted  */

);
```

JOIN
====

The JOIN operation permits queries across more than one table. See both
the [JOIN
tutorial](https://www.postgresql.org/docs/current/tutorial-join.html)
and the [Table
expressions](https://www.postgresql.org/docs/13/queries-table-expressions.html)
section from Postgres manual for full details.

Assume R1 to be a row of Table T1. Similarly R2 for T2. Normally should
explicitly specify columns required and use table prefix to avoid
ambiguity.

INNER JOIN
----------

For each row R1 of T1, the joined table has a row for each row in T2
that satisfies the join condition with R1.

LEFT JOIN
---------

Same as INNER JOIN except that output also includes any row in T1 that
does not match one or more rows in T2. Null values are substituted for
T2 in the output row.

RIGHT JOIN
----------

Similar to LEFT JOIN. Same as INNER JOIN, except any row in T2 that does
not match $\ge 1$ rows in T1 will be output. Null values are subtituted
for T1 columns in the otuput row.

FULL JOIN
---------

Similar to combination of LEFT and RIGHT JOIN. INNER JOIN performed.
Then rows in T1 without corresponding T2 output with nulls for T2. Same
again, rows in T2 without corresponding T1 rows output with nulls for
T1.

CASE clause
===========

[CASE](https://www.postgresql.org/docs/13/functions-conditional.html#FUNCTIONS-CASE)
permits conditionals in select statement outputs.

``` {.postgresql}
/* using case statement */ 
SELECT account_id, balance, limit,
CASE 
WHEN balance>limit then 'OVERDRAWN' 
WHEN balance=0 THEN 'ZERO' 
ELSE 'OK' 
END AS status
FROM accounts /* rest of query */
;
```

Views {#sec:views}
=====

[Views](https://www.postgresql.org/docs/13/tutorial-views.html) are
defined by @connolly:2015:database as:

> The dynamic result of one or more relational operations operating on
> the base relations to produce another relation. A view is a virtual
> relation that does not necessarily exist in the database but can be
> produced upon request by a particular user, at the time of the
> request.

``` {.postgresql}
/* Creation syntax: */
CREATE VIEW my_view AS
SELECT ... ;
/* select statement can be any valid select */

/* VIEW can be selected like any other table */
SELECT * FROM my_view ; 
```

Domains {#sec:domains}
=======

[Domains](https://www.postgresql.org/docs/13/domains.html) are
user-defined types based on underlying type. Defaults to NULL allowed,
best to define any NOT NULL conditions on the underlying columns. CHECK
constraints can be defined.

``` {.postgresql}
/* Number to hold 1-10 user rating */
CREATE DOMAIN rating AS integer CHECK ( VALUE >= 1 AND VALUE <=10 );

/* Just use the domain as type when creating table */
CREATE TABLE restaurants (
    id bigserial primary key,
    /* creating two columns using our domain: */
    visitor_rating rating not null,
    reviewer_rating rating, 
    /* other columns */
);
```

Enumerated types {#sec:enumerated-types}
================

[Enumerated
types](https://www.postgresql.org/docs/13/datatype-enum.html) allow
columns to accept a small number of allowable values. Examples include
day of week, identified gender, north / south / east / west.

``` {.postgresql}
/* creating an enumerated type */
CREATE TYPE mood AS ENUM ( 'sad', 'ok', 'happy');

/* creating column using enumerated type  */
ALTER TABLE people ADD COLUMN reported_mood mood;
```

Exercise
========

Create a simple task manager application using two tables (minimum) for
projects and tasks (linked to projects). Every table should have
appropriate data types, NULL/NOT NULL, PRIMARY KEY, UNIQUE KEYs. Tables
should be linked using foreign keys with correct ON DELETE / ON UPDATE
behaviours chosen. Create a view that encapsulates a query involving at
least two tables and provides at least one computed column using the
CASE clause. You should make use of enumerated types and domains.
