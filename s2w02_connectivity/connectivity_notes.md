% Database connectivity

Database connectivity
=====================

As well as text-based `psql` client, any other client that implements
the postgresql client protocol can connect and use DB server.

Similar access patterns for other RDBMS.

We often will encounter situations where we wish to write a program in a
standard language like Python, Java etc that needs to connect to a
database. This is normally done by using a client library, for
PostgreSQL this is `libpq`.

Database passwords
==================

RDBMS servers have the concept of usernames/passwords tied to database
permissions (details later on).

These are entirely separate from system usernames/passwords (normally).

So far, just typing `psql` has connected your Linux user
(`yourusername`) to a database of the same name (`yourusername`) as the
PostgreSQL user `yourusername`. No password is required. This is a
convenience but can be a security risk, and will not work when the
client is on a different machine to the server or when disallowed by the
DB server administrator.

Setting a database password
---------------------------

Re-setting your database password in psql:

``` {.postgresql}
\password
```

Python on shared server
=======================

Python can be started interactively at the shell prompt by typing
`python3`.

Note that `python` will start the older Python 2 version. Check the
startup banner if you are not sure which Python version you are running.

For writing programs/scripts you just need a text editor. A number are
available: `nano` is fine, I recommend `emacs`, others use/like `vim`.

These can then be executed by exiting the text editor and typing
`python3 myscript.py`.

Psycopg2 connector
==================

Python provides a number of ways to access databases, we will use the
[Psycopg2](https://www.psycopg.org) library.

Connecting
----------

``` {.python}
# psycopg library renamed to make shorter
import psycopg2 as pg

# connect to DB on local server
conn = pg.connect(database="yourname", user="yourusername", password="yourdbpw")
```

Cursors
-------

Psycopg2 can handle multiple concurrent queries (and their results). For
this reason each operation must go through a cursor.

``` {.postgresql}
# create a cursor for later use
cur = conn.cursor()
```

Confusingly, these are NOT the same as server-side cursors which we will
meet later.

Executing statements
--------------------

Statement execution should always use query parameters, either
positional or named. Placeholders in the query are substituted by values
passed in, which are normally themselves python variables.

``` {.python}
description = "mow the lawn"
priority = 5

# execute a statement using position parameters
cur.execute("INSERT INTO tasks ( description, priority ) VALUES (%s)",( description, priority) )

# alternative using named parameters (
cur.execute("INSERT INTO tasks (description, priority) VALUES (%(description)s, %(priority)s) , {'description':description, 'priority':priority} )

# NEVER use string concatenation!
```

Queries
-------

Queries are built using named parameters, but results need to be
handled.

``` {.python}
query = "SELECT id, description, priority, status FROM projects ORDER BY priority DESC WHERE status=%s"
status = "PLANNING"

cur.execute(query, (status))

# number of rows returned (if required)
print('rows returned: ' + cur.rowcount)

# loop through all returned rows
for row in cur.fetchall():
    print(row)

# optional: rewind the cursor
cur.scroll(0, 'absolute')
```

PANDAS integration {#sec:pandas-integration}
==================

You are familiar with the use of [Pandas](https://pandas.pydata.org/)
for statistical tasks. PANDAS can be combined with relational databases
to read the output of queries.

Dataframe from query {#sec:dataframe-from-query}
--------------------

``` {.python}
# psycopg2 needed for connection
import psycopg as pg
conn = pg.connect(database="yourname", user="yourusername", password="yourdbpw")

# import pandas 
import pandas as pd

# retrieve a query as a pandas data frame
tasks = pd.read_sql_query('SELECT * FROM tasks',conn)

# use tasks like any other pandas dataframe
```

TMUX
====

When working between multiple programs on the shared server, consider using TMUX.

Exercise
========

1.  Construct a task manager (tasks, projects) \[ datatypes, null/not
    null, keys, foreign keys, domains + enumerated types \]
    for yourself. (Alternatives: expense tracker, sports score, track
    exercise - anything with \*2\* or more tables.) Set up the tables
    using psql.

2.  If you haven’t already, set a password using psql’s `\password`.

3.  Write Python program (in nano, emacs, vim) to:

    1.  Allow user to create either a new task or a new project

    2.  If a new project, get the name & then exit.

    3.  If a new task, display list of projects.

    4.  Ask user to choose which project new project task belongs to.

    5.  Ask user name of new task.

    6.  Then ask to save or not. If yes, commit, if not, rollback.

4.  Write another Python program to display a query using Pandas (for
    example a VIEW showing tasks and their projects JOINed).

5.  Optional: When finished, use SFTP to take a copy of your program
    onto your local computer.
