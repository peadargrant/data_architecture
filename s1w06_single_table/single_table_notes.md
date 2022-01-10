Introduction
============

This week’s class covers the setup and usage of a single table. As a
data analyst you will sometimes encounter situations like last week
where you will run queries on databases that already exist. Other times
you will be tasked with setting up a database to conduct one-off or
ongoing analyses.

We will therefore look at how data needs to be modelled for a single
table, focusing on data types and constraints to improve data integrity.

You must closely refer to the [Data
Definition](https://www.postgresql.org/docs/13/ddl.html) and [Data
Manipulation](https://www.postgresql.org/docs/13/dml.html) chapters of
the [PostgreSQL
manual](https://www.postgresql.org/docs/current/index.html) through this
week’s exercises. As this is a MSc-level course it is expected that you
will be able to construct SQL statements by researching documentation
for yourself.

Prerequisities
==============

Before starting make sure that you:

-   created your SSH public/private key-pair.

-   can login over SSH to the new shared server with the details mailed
    to you.

-   reviewed the simple `SELECT` queries from last week.

For today’s lab login to the shared server and run `psql`. You should be
connected to a database with the same name as your username. See
[Accessing a
Database](https://www.postgresql.org/docs/13/tutorial-accessdb.html) in
the PostgreSQL manual.

Key demonstration concepts
==========================

Key concepts will be easily learned through repeated practice and
reference to manual.

CREATE table

:   to define table name, columns (type, constraints)

ALTER table

:   for incremental changes.

DROP table

:   without warning!

CRUD operations

:   :

    INSERT

    :   rows populating specified columns with data given.

    UPDATE

    :   tale, optionally select rows with `WHERE`.

    DELETE

    :   rows from a table, optionally select rows with `WHERE`.

Null
====

Null means logically unknown (empty, incomplete, not applicable,
undefined). **NOT** the same as a numeric zero or the empty string.

Null “pollutes” other expressions. More generally, if any variable in an
expression (other than a test for null) is null, then the expression is
null:

	1 + NULL = NULL 
	1 + NULL - NULL = 1 

Must consider 3-value logic (true/false/null) rather than 2-value logic
(true/false).

Constraints
===========

Constraints allow us to define acceptable values for columns to aid data
integrity.

[Refer to constraints section in the PostgreSQL
manual](https://www.postgresql.org/docs/13/ddl-constraints.html) for:
check, not null, unique, primary key. *We will meet foreign keys and
exclusion constraints later on*

NOT NULL
--------

The NOT NULL constraint prevents a particular column value being null.
Inserts will fail unless default column value specified.

``` {.postgresql}
-- During table creation:
CREATE TABLE tasks (
   description text not null,
   /* other columns */
);
```

UNIQUE
------

The UNIQUE constraint prohibits two rows from having an equal set of
attribute values for the columns specified:

``` {.postgresql}
-- During table creation:
CREATE TABLE tasks (
   description text unique,
   /* other columns as necessary */
   project_code text,
   subproject_code text,
   unique(project,subproject)
); 

-- Afterwards
ALTER TABLE tasks ADD UNIQUE (project, subproject);
```

Primary key
===========

Primary key is a unique key that is not null. Unambiguously identifies
each row.

Max 1 primary key per table. Every table should have a primary key.

``` {.postgresql}
-- specifying primary key
CREATE TABLE accounts ( 
    account_number bigint primary key
    /* other columns as necessary */
);

-- primary key covering two columns
CREATE TABLE accounts (
    branch bigint, -- not null automatic
    account_number bigint,  -- not null automatic
    /* other columns */
    primary key (branch, account_number)
    /* other constraints etc. */
)
```

Default values
==============

Default values are automatically inserted when unspecified in INSERT
statement. Often used in conjunction with NOT NULL. Can be static value
or based on functions (see later).

``` {.postgresql}
CREATE TABLE accounts (
    /* other columns */
    balance bigint not null default 0;
    created timestamp not null default now(); 
);
```

Auto-increment column
---------------------

We can use the column types SERIAL or BIGSERIAL for auto-incrementing
columns. Generally prefer BIGSERIAL. Shorthand for default value based
on sequence generator (later on).

``` {.postgresql}
CREATE TABLE customers ( 
    id BIGSERIAL PRIMARY KEY,
    /* other columns & constraints */
);
```

Transaction control
===================

[PostgreSQL transaction
control](https://www.postgresql.org/docs/13/tutorial-transactions.html)
can be used in simplest form to give basic “undo” capability:

``` {.postgresql}
-- start a new transaction
BEGIN;

/* execute SQL statements then either: */

COMMIT; /* save the changes */
-- or
ROLLBACK; /* undo the changes */
```

Error handling
--------------

If we don’t BEGIN a transaction we implicitly BEGIN before the statement
and COMMIT after it. Errors (e.g. syntax) will abort the transaction,
requiring a ROLLBACK before any more statements will be accepted.

Savepoints
----------

``` {.postgresql}
BEGIN;

/* sql statement block 1 */

-- define a savepoint
SAVEPOINT sp1;

/* sql statement block 2 */

-- rollback to the savepoint undoes block 2; 
ROLLBACK TO sp1;

-- then either:
COMMIT; /* or ROLLBACK */
```

UNIX tools
==========

There are a few useful non-SQL tools we will need. Many of these tools
work (or have equivalents) on Windows desktops too. The best way to
learn how to use these is to use their inbuilt help or man pages.

Inbuilt help is usually accessed by a switch, often `-h`. If a command
is run with no input it will often give the help command in the error
message.

Most tools also have a manual page called a manpage:

``` {.bash}
# general pattern
man commandname

# example man page for curl (see next section)
man curl
```

Hit `q` to exit a manpage.

Using CURL to download data
---------------------------

When we are logged into a remote server we may wish to download data
from the internet. There are actually text-mode browsers like lynx,
links, links2 but these have become less usable since the web’s descent
into excessive visual flourish and JavaScript-centricity.

Instead we will make use of a tool called `curl` which can download the
contents of a particular URL to a file. CURL is a very useful tool, and
you should consult its inbuilt help or manpages (`man curl`) to learn
more about its features. Basic usage:

``` {.bash}
# general pattern
curl -o output_file_name URL

# download the list of London stations at:
# https://www.doogal.co.uk/london_stations.php
#
# https://www.doogal.co.uk/LondonStationsCSV.ashx
curl -o stations.csv  https://www.doogal.co.uk/LondonStationsCSV.ashx
```

Printing file contents to screen
--------------------------------

``` {.bash}
# listing the contents of the current directory
ls 

# printing out the stations.csv file to the screen
cat stations.csv 

# printing out the file with pagination
cat stations.csv | more
# using the bar | operator pipes the output of one command to another
```

Exercise
========

1.  Setup a simple table to keep track of your tasks / expenses / other
    data. Your table should at least have a description and due date.
    Add in other columns (such as priority, e-mail to notify when done)
    as necessary.

    -   Keep a track of which columns need to be there.

    -   Make clear decisions around NULL / NOT NULL.

    -   Decide what column(s) is/are to make up the primary keys.


