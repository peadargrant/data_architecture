---
title: Database Management Systems
---

Database management systems (DBMS) {#sec:dbms}
==================================

For overall history see [@grad:2009:history].

Client-server
-------------

Most database management systems run in a client-server model, .

The server process manages the data store and processes requests from
clients. The server can be running on any of the following *hosts*:

-   Standard laptop / desktop computer

-   Dedicated server computer (in a data centre environment)

-   Cloud-based virtual host, called a compute instance. (e.g.
    Amazon EC2)

-   A managed database service provided by a cloud service
    provider (e.g. Amazon RDS, Azure, Google Cloud, IBM Cloud)

The client program accesses the server using a server-specific protocol.
Clients normally access through IP networks using TCP on a specified
port number. Examples of clients:

-   Most databases have a simple command-line client that can send
    requests to the database and display results

-   Apps can be written to access database servers using a
    client library.

    -   Generally the text-mode client uses this library internally too!

Two things to note about the client:

-   The client may in some cases be running on the same host as
    the server.

-   Software that is the client of a DBMS may itself be a server.

    -   Example: a web application is written in Java using the Spring
        framework and provides a web server using an embedded
        Tomcat server. The web application is itself a client of the
        DBMS it accesses.

This also implies that there is a degree of concurrency, where multiple
clients access the same database at the same time.

Key terms
=========

Structured query language (SQL) {#sec:sql}
===============================

For a general overview see [@chamberlain:2012:early].

PostgreSQL {#sec:postgresql}
==========

We will focus on PostgreSQL as our primary database. Later on we will
introduce other technologies. Reasons:

-   Support exists for geospatial data, JSON, XML, full-text search etc.

-   It is free software and can be installed on any operating system.

You should bookmark the
[PostgreSQL](https://www.postgresql.org/docs/13/) documentation.

As we continue we will refer to PostgreSQL as Postgres for brevity.

Connecting to a remote host
---------------------------

Database basics
===============

Make sure you can connect to the SSH server given. (Note that this
server will not be available outside the time period of this lab
session.)

Running psql
------------

Once logged in, we can use the `psql` command-line client to connect to
the PostgreSQL server. Each server can host a number of databases
independently of each other. Today we are going to use a database called
`population`.

    psql population

Note the DBMS didn’t ask us for a username/password. This is because it
is setup to trust local connections with the same name as the login
username. Generally a DBMS will ask for a username/password.

Once logged in you should see a prompt similar to:

    psql (9.2.24)
    Type "help" for help.

    population=> 

There are two types of command we will encounter:

-   SQL statements to be executed by the server

-   Client commands (that sometimes get expanded into server-side SQL).
    These are usually prefixed with a backslash.

You can get a list of all client commands using \\?.

Listing all tables
------------------

A database in its simplest form is like an Excel workbook. Just as an
excel workbook has one or more sheets, a database may have one or more
tables in it. To find out the tables (and other objects) in our DB we
can ask the database to describe the tables:

    \dt

Our population database has two tables:

               List of relations
     Schema |    Name    | Type  |  Owner   
    --------+------------+-------+----------
     public | directions | table | ec2-user
     public | population | table | ec2-user
    (2 rows)

Describing a table
------------------

A table consists of a number of columns. Each row is a record. We can
find out the schema definition using the client command `tablename`. To
find out more about the `directions` table we could say:

``` {.psql}
\d directions
```

Would give us:

        Table "public.directions"
       Column   |  Type  | Modifiers 
    ------------+--------+-----------
     fullname   | text   | 
     code       | text   | 
     vertical   | bigint | 
     horizontal | bigint | 

[Refer to datatypes in the PostgreSQL
manual](https://www.postgresql.org/docs/13/datatype.html)

SELECT queries
==============

We will review basic querying operations in SQL. If you have experience
already with relational databases (MySQL, Microsoft SQL, Oracle) you
will find most of this section familiar. You should refer to the
[queries section of the PostgreSQL
manual](https://www.postgresql.org/docs/13/queries.html) for further
detail on the examples below.

Entire table
------------

Selecting an entire table using the asterisk (\*) to pick all columns.

``` {.psql}
select * from directions;
```

Note that statements need to be terminated with the semicolon (;). If
you omit the semicolon the prompt will change from `=>` to `->`.

In PostgreSQL we can also use the shortened version

``` {.psql}
table directions;
```

Sorting
-------

Unlike a spreadsheet, the order of rows in result sets from database
queries is non-deterministic by default. They are *not* necessarily
alphabetical order, insertion order or any other pattern. We use the
`ORDER BY` clause to enforce ordering:

``` {.psql}
select * from directions order by fullname asc;
```

The order direction is either `asc` for ascending or `desc` for
descending.

See [sorting page of PostgreSQL
manual](https://www.postgresql.org/docs/13/queries-order.html) for
further details.

Where clause
------------

The `WHERE` clause limits the output

``` {.psql}
select * from directions where vertical=0;
```

Text is best compared using the `LIKE` operator which allows `%` to
represent any text.

``` {.psql}
select * from directions where code like '%th'; 
```

Column specification
--------------------

We can specify specific column names

``` {.psql}
select fullname, code from directions;
```

Column expressions
------------------

PostgreSQL supports powerful expressions that combine the values of
different columns. The columns themselves need not be selected in the
result set.

``` {.psql}
select fullname, code, vertical+horizontal from directions;
```

Column labels
-------------

Columns in the result set receive automatic names. These are normally
the name of the column or are derived from an expression. We can assign
specific names using the `AS` keyword.

``` {.psql}
select fullname, code, vertical+horizontal as hey from directions;
```

See [column labels in PostgreSQL
manual](https://www.postgresql.org/docs/13/queries-select-lists.html#QUERIES-COLUMN-LABELS).

Aggregate functions
===================

Mastering aggregate functions will significantly improve your
capabilities to query databases. You should refer to the [aggregate
functions section of the PostgreSQL
manual](https://www.postgresql.org/docs/13/functions-aggregate.html) as
you review the following examples.

Count
-----

The simplest aggregate function is `COUNT` to return the number of rows
matched by a specific query. At its simplest, we can tell the number of
rows in a table.

``` {.psql}
select count(*) from directions;
select count(*) from population; 
```

Count is often used with where to obtain the number of rows matching a
specific condition:

``` {.psql}
select count(*) from directions where code like '%th'; 
```
