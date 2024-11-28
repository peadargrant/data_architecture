% JOINS lab

The JOIN operation permits queries across more than one table.

Consult from Postgres manual for full details:

1. [JOIN tutorial](https://www.postgresql.org/docs/16/tutorial-join.html)
2. [Table expressions section](https://www.postgresql.org/docs/16/queries-table-expressions.html)


# Task 0: Load database

Use the following command to load the `joins_example.sql` to your `psql` database:

	psql < joins_example.sql
	
This command uses the UNIX redirection operator `<` to put the contents of the file in instead of the keyboard input.

You could also instead use the `-f` switch of `psql` to achieve the same outcome:

	psql -f joins_example.sql
	
	
# Task 1: Inspect the database

Use the `\d` client command(s) to determine the table(s) in the database.

From this information draw out a basic ER diagram on paper so that you can refer to it later on.

Look carefully at the *cardinality* on each side of the foreign key relationship.


# Task 2: Try out JOINs

For theory purposes, assume R1 to be a row of Table T1.
Similarly R2 for T2.

Normally should explicitly specify columns required (i.e. avoid use of `*`) and use table prefix before column names to avoid ambiguity.


## INNER JOIN

For each row R1 of T1, the joined table has a row for each row in T2 that satisfies the join condition with R1.

	select department.name as department, product.name as product from department join product on product.department=department.id;

Can you identify which rows are missing from the output? 


## LEFT JOIN

Same as INNER JOIN except that output also includes any row in T1 that does not match one or more rows in T2. Null values are substituted for T2 in the output row.

Add in the word `LEFT` before the join and try the query again:

	select department.name as department, product.name as product, price  from department left join product on product.department=department.id; 
	
Can you now see the rows from the first table without corresponding rows in the second table? 
	


## RIGHT JOIN

Similar to LEFT JOIN. Same as INNER JOIN, except any row in T2 that does not match 1 or rows in T1 will be output.
Null values are subtituted for T1 columns in the otuput row.

Change the above query to `RIGHT` instead of `LEFT`:

	select department.name as department, product.name as product, price  from department right join product on product.department=department.id; 

How has the output changed?


## FULL JOIN

Similar to combination of LEFT and RIGHT JOIN:

1. INNER JOIN performed first.
2. Then rows in T1 without corresponding T2 output with nulls for T2.
3. Same again, rows in T2 without corresponding T1 rows output with nulls for T1.

This time try `FULL` before `JOIN`:

	select department.name as department, product.name as product, price  from department full join product on product.department=department.id;
	
Has the output changed as you'd expect?





