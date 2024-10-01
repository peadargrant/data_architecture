% Single-table lab

You must closely refer to the
\href{https://www.postgresql.org/docs/15/ddl.html}{Data Definition} and
\href{https://www.postgresql.org/docs/15/dml.html}{Data Manipulation}
chapters of the
\href{https://www.postgresql.org/docs/15/index.html}{PostgreSQL manual} through this week's exercises.

As this is a MSc-level course it is expected that you will be able to construct SQL statements by researching documentation for yourself!
The best way to learn is by trying!


# Task 1: Connection

For today's lab login to the shared server:

	ssh username@data.comp.dkit.ie

Once connected then run:

	psql

You should be connected to a database with the same name as your username.

See [Accessing a database](https://www.postgresql.org/docs/14/tutorial-accessdb.html}{Accessing) in the PostgreSQL manual.

# Task 2: Sales table

1. Implement the sales table example yourself from the class.
2. Try to insert some sample data into it.


# Task 3: Design exercise

Setup a simple table to keep track of your tasks / expenses / other data. Your table should at least have a description and due date. Add in other columns (such as priority, e-mail to notify when done) as necessary.
	
- Keep a track of which columns need to be there.
- Make clear decisions around NULL / NOT NULL.
- Decide what column(s) is/are to make up the primary keys.


