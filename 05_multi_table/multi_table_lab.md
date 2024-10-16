% Multi table databases lab

# Task 0: Connect

Connect to the database server using SSH:

	ssh yourname@data.comp.dkit.ie
	
*These instructions won't be repeated any more!*



# Task 1: Preparation

Run `psql` to connect to your own database.

Use `\d` to list out all tables.

For every table, drop it using `DROP TABLE tablenamehere;` so that you have a clean database to start from.
For example, to delete last week's `sale table` we write:

	DROP TABLE sale;
	
Make sure that the DB response is `DROP TABLE`.
If it says nothing at all you might have forgotten the semi-colon at the end.



# Task 2: Create the producer table

Start off by creating the `producer` table using the `CREATE TABLE` command.

	CREATE TABLE producer (id serial primary key, name text not null unique );

Use `\d producer` to *describe* your producer table.
When you are finished, your producer table's description should look like:

	grantp=# \d producer
                            Table "public.producer"
	Column |  Type   | Collation | Nullable |               Default
	-------+---------+-----------+----------+--------------------------------------
	id     | integer |           | not null | nextval('producer_id_seq'::regclass)                                                       name   | text    |           | not null |
	Indexes:
		"producer_pkey" PRIMARY KEY, btree (id)
		"producer_name_key" UNIQUE CONSTRAINT, btree (name)

Notice the two indexes that maintain the two constraints: the primary key on the `id` column and the unique key on the `name` column.


# Task 3 : Create the rate type

The `tender` table will be be no more complex than the `producer` table, but we must create the `rate` type first.

	CREATE DOMAIN rate numeric(6,4);
	
Make sure that we get the `CREATE DOMAIN` response.


# Task 4: Create the tender table

Use the example from the producer table to create the tender table.

	create table tender ( id serial primary key, name text not null unique, rate rate not null default 0 ) ;

We've made some additions:
- The `rate` column for card charges uses our new user-defined type.
- We set a default value on it to make data maintenance easier

Make sure that `\d tender` returns:

	grantp=# \d tender
		Table "public.tender"
	 Column |  Type   | Collation | Nullable |              Default
	--------+---------+-----------+----------+------------------------------------
	 id     | integer |           | not null | nextval('tender_id_seq'::regclass)
	 name   | text    |           | not null |
	 rate   | rate    |           | not null | 0
	Indexes:
		"tender_pkey" PRIMARY KEY, btree (id)
		"tender_name_key" UNIQUE CONSTRAINT, btree (name)

# Task 5: Create the amount type

We must create the `amount` type for the sale table.

	CREATE DOMAIN amount numeric(6,2);
	
Make sure that we get the `CREATE DOMAIN` response.

Use the `\dD` command to show all *domains* and ensure that looks like:

	grantp=# \dD
								 List of domains
	 Schema |  Name  |     Type     | Collation | Nullable | Default | Check
	--------+--------+--------------+-----------+----------+---------+-------
	 public | amount | numeric(6,2) |           |          |         |
	 public | rate   | numeric(6,4) |           |          |         |
	(2 rows)



# Task 6: Create the sale table

The sale table is the most complex, as it involves a number of different parts.
To begin let's just create the table with its `id`, `description`, `quantity` and `total_price` columns and we'll add it to it.

	CREATE TABLE sale ( id serial primary key, timestamp timestamp not null default now(), description text not null, quantity int not null default 1, total_price amount not null ) ; 
	
If you make a mistake there are a number of commands to help you, like:

	DROP TABLE ... ; 
	ALTER TABLE ... ; 
	ALTER TABLE xyz ALTER COLUMN abc ... ; 
	
Then we'll add the timestamp column defaulting to now: 


## Foreign key for producer

Every sale is for a producer, let's add this now: 

	ALTER TABLE sale ADD COLUMN producer int not null references producer ; 
	
The `references producer` is the key part - this encodes the foreign key link inthe database. 

## Foreign key for tender

Every sale is paid with a particular tender type, let's add this now:

	ALTER TABLE sale ADD COLUMN tender int not null references tender ;

## Confirm sale table 

Use `\d sale` to confirm that the sale table is as below (note that the column order does not matter):

	grantp=# \d sale
								   Table "public.sale"
	   Column    |  Type   | Collation | Nullable |             Default
	-------------+---------+-----------+----------+----------------------------------
	 id          | integer |           | not null | nextval('sale_id_seq'::regclass)
	 timestamp   | timestamp without t | not null | now()
	 producer    | integer |           | not null |
	 description | text    |           | not null |
	 quantity    | integer |           | not null | 1
	 total_price | amount  |           | not null |
	 tender      | integer |           | not null |
	Indexes:

	"sale_pkey" PRIMARY KEY, btree (id)
	Foreign-key constraints:
		"sale_producer_fkey" FOREIGN KEY (producer) REFERENCES producer(id)
		"sale_tender_fkey" FOREIGN KEY (tender) REFERENCES tender(id)


# Task 7: Insert sample data

## Producers

First let's insert some sample data into the producer table, e.g.:

	insert into producer (name) values ('Maeve');
	
Now insert at least 3 more producers.
List out the table contents using:

	select * from producer ; 

It should look like:

	grantp=# select * from producer ;
	 id | name
	----+-------
	  1 | Maeve
	  2 | Jim
	  3 | Pat
	(3 rows)

## Tenders

Sometimes a system will have some data that's intrinsic to its functionality.
Although we could use enumerated types (or similar), the foreign key to another table provides the most flexibility.

Insert tenders named, `Cash`, `Card` and `Revolut`.
Use the same pattern as above to construct the statement. 

Set the rate on card to be `0.0168` using:

	UPDATE tender set rate=0.0168 where name like 'Card';

Issue the command:

	SELECT * FROM tender; 
	
Make sure that it resembles the following:

	grantp=# select * from tender ;
	 id |  name   |  rate
	----+---------+--------
	  1 | Cash    | 0.0000
	  2 | Card    | 0.0000
	  3 | Revolut | 0.0000
	(3 rows)

## Sales

Insert approx 10 sample sales for differing amounts, quantities, prices etc.
Assign at least 1 sale to each type of tender.
Assign at least 1 sale to each producer.


# Task 7: Foreign Key Test

The aim of a foreign key is to ensure *referential integrity*.

What happens if you try to delete a producer?
Use a `DELETE` statement with a `WHERE` clause to pick out a single producer to delete:

	DELETE FROM producer WHERE id=1;

Similarly, what happens if you try to delete a tender?
Construct the command from the producer example above.


# Task 8: Basic querying

## Tender totals

From the data you have entered, you can produce a summary of the total card, cash and Revolut amounts:

	SELECT tender, SUM(total_price) as total FROM sale GROUP BY tender ; 
	
The problem here is that the names aren't visible.
To do this, we `JOIN` the query to the tender table.

	 SELECT tender.name, SUM(total_price) as total FROM sale JOIN tender ON tender.id=sale.tender GROUP BY tender.id ORDER BY tender.id ;
	 
Let's modify the query to restrict the totals to today only:

	 SELECT tender.name, SUM(total_price) as total
	 FROM sale
	 JOIN tender ON tender.id=sale.tender
	 WHERE timestamp::date=now()::date
	 GROUP BY tender.id
	 ORDER BY tender.id ;
	 
We'll learn a lot more about JOINS when we look at advanced queries.


## Producer totals

Now, you try to produce a query showing the producer totals based on the example above for tender types.


# Task 9: Views

Encapsulate both queries above as views.


