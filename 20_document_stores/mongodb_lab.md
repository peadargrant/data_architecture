% MongoDB lab

**Useful links:**

# Connecting

## Remote or laptop students

*Skip if on a lab machine*

[Connect to the VPN](https://dkitvpn.dkit.ie) at the beginning of this class.

## Usual reminder

The lab servers are not backed up or secure!

- Don't put any valuable or confidential data on them.
- Don't use your DkIT or any important password on them.
- Manage files you create on them by copying them off with sftp or using the school GitLab server


## Login to the shared server

First, we'll login to the shared lab server where you've already used PostgreSQL on a regular basis.

	ssh yourname@10.200.172.60
	

## Connect to mongodb server using mongosh

In today's lab we are going to use a shared mongodb instance.
Unlike Postgres, the MongoDB instances is provisioned on a separate Dell R230 server running Linux in the same rack in P1153.

MongoDB has its own username / password database (and can be configured for single sign-on but not here).
All students have been provisioned with a mongodb user with the same name as yourself and initial MongoDB password `1Password`.

Instead of logging into the MongoDB server over SSH directly, we will use the `mongosh` client on the shared server to connect remotely using MongoDB's own protocol to the mongod instance.

	mongosh --host 10.200.172.57  -u yourusername
	
Enter your initial *mongodb* password `1Password` at the prompt.
You should then get output something like:

	Enter password: *********
	Current Mongosh Log ID: 67a0fb38a894553a80544ca6
	Connecting to:          mongodb://<credentials>@10.200.172.57:27017/?directConnection=true&appName=mongosh+2.3.8
	Using MongoDB:          8.0.4
	Using Mongosh:          2.3.8

	For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/

	test> 

This shows that you are connected to the `test` database.
You now need to connect to your own.


## Connect to your own database

Just as in the case of PostgreSQL, a single MongoDB instance hosts a number of isolated MongoDB databases.
Like with our shared PostgreSQL installation there is a mongodb database with the same name as your username to which you have full access.
Change to your own database using the command:

	use yourname
	
Note that the prompt now changes to `yourname>`, meaning that commands you enter will now run against your own database instead of the `test` one.
	
Confusingly, MongoDB's authorization system allows you to connect to any database in the system, whether you have rights on that database or not.
It will only block when you actually try to do something you're not authorized to do.
To ensure that you have access rights to your own database, we're going to run a command that will cause an error if you don't have the right access levels:

	show collections

As you've no collections in your database, this command should just return nothing.

*If you get an error here, ask me for help!*


# Document databases

MongoDB is an example of a *Document Database* or *Document Store*.

A single MongoDB instance hosts multiple databases, each with one or more collections that each store one or more JSON-structured documents.


## Document

We'll take a document to mean an isolated unit of structured data.

You're already familiar with Python dictionaries and lists.

These can be interwoven to make a document, which can be output (or dumped) into a number of formats.
Primarily this would be JSON, but XML, YML and other formats are possible. 


## Collection

In MongoDB, related Documents are grouped into *collections*.

Unlike tables in relational databases:

- There is no requirement for there to be any similarity between documents in a collection.
- A collection only exists when at least one document is inserted into it. 
Empty collections do not exist. 

Collections make it easy to search for related documents, and to bulk delete or update documents. 


# Basic task list example

We're going to build a basic task list to build familiarity with MongoDB using `mongosh`.

MongoDB internally uses JavaScript as its native query language, which is a rather different experience from the SQL that we've used to date.
Luckily we only need to build familiarity with a few concepts to start using it. 


## Design

Our task list will consist of one or more task items in a single *collection* called `tasks`.
Each task will normally have the following attributes:

- **description** human readable description (e.g. mow the lawn, wash the dishes)
- **done** boolean if task is complete (true / false)


## Basic operations

In MongoDB there is no DDL step as such. 


### Creating collections and items

Collections and items are created implicitly when they are inserted.

	db.tasks.insertOne( { description: "wash the dishes", done: false } )
	
The `db` object represents the database and is always in scope.
Most mongodb commands operate on the `db` object.


### Listing out all collections

Now that our collection has been created, it will appear in the list of collections:

	show collections


### Listing out all contents in the collection

We can get all items in a collection once we know its name using the `find` method:

	db.tasks.find()
	

### Adding more data

We can obviously call `insertOne` as many times as we like. 

	db.tasks.insertOne( { description: "mow the lawn", done: false } )
	db.tasks.insertOne( { description: "call the electrician", done: false, note: "ask about discount" } )

Now insert a few extra tasks into your collection.


## Querying

As with SQL, more advanced queries are best learned on an as-needed basis.
There are a few key building blocks that we'll study now, continuing on with our task manager example.

We already know that calling the `find()` method will get all items in that collection.
By adding arguments to the `find()` method in the form of JSON we can narrow down the search.


### Does a field exist?

Given that documents are free-format, we may want to include/exclude items based on whether a particular field exists or not. 

	db.tasks.find( { "note": { "$exists": true } } )


### Nullity

More confusingly, a field can exist / not exist, but it can also be null or have a value.
Let's try an insertion like:

	db.tasks.insertOne( { description: "call the plumber", done: false, note: null } )
	
If we now re-run the previous example:

	db.tasks.find( { "note": { "$exists": true } } )
	
We'll now see that the null valued field does exist.
Given that by default MongoDB has no schema checking or enforcement, this confusion could get out of hand if we're not disciplined in our usage.
If we wanted to find records where the field has a non-null value we can instead use: 

	db.tasks.find( { note: { $ne: null } } )
	
Of course our problem of interest will determine how we should handle field existence and nullity.


### Combining criteria

We can combine criteria for a single field thus:

	db.tasks.find( { note: { $exists: true, "$eq": 'ask about discount' } })

The criteria we include are a logical AND to produce the output documents.


# Python connectivity

As we've seen with PostgreSQL, databases are most useful when we connect them directly with our own Python code.
This bring rich capabilities in terms of data visualisation, loading and analysis.


## PyMongo

The `pymongo` library provides connectivity from Python to MongoDB and allows us to manipulate the returned results in a reasonably Pythonic style.
`pymongo` is installed on the shared server.


## Username / password

When using our own code we still need to authenticate to the database server.
It's generally a bad idea to hard-code credentials in program code.
Let's create a config file to store the values using the common INI format that Python supports to store these.

Create a file called `mongodb.conf` using `emacs` with the following content:

	[mongodb]
	host=10.200.172.57
	username=your-username-here
	password=your-mongodb-password-here

We can then use the `configparser` module in Python to read this information.
Config files are very useful for storing this type of information.
If you're using source control like Git, **don't commit them** to your repository.


# Product database example

One thing document stores in general are very good at is storing data you've ingested from elsewhere, where you didn't design or don't know the schema in advance.
They then make it very easy to run queries against that data compared to storing it as flat files.

We're going to demonstrate this using information from a few stores that employ the Shopify sales platform to power their online store.

Shopify happens to provide information on products at `products.json` on every site by default.
It will return up to 250 products for a single shopify call.


## Store list

There a few retailers I've found that use Shopify.
In `mongosh` create a new collection named `stores` (adapt the instructions above) and populate 2 of the retailers below as `name` and `url`:

1. Carraig donn: https://www.carraigdonn.com
2. Carolyn's Sweet Shop: https://www.carolynssweetshop.ie
3. SOS Cookies: https://www.soscookies.ie

Output should look similar to:

	grantp> db.stores.find({})
	[
	  {
		_id: ObjectId('67a50545105786f542544ca7'),
		name: 'carraig donn',
		url: 'https://www.carraigdonn.com'
	  },
	  {
		_id: ObjectId('67a5103e105786f542544ca8'),
		name: 'SOS cookies',
		url: 'https://www.soscookies.ie'
	  }
	]


## Schema design

Although we don't need to define columns and datatypes in advance, we do need to decide on how to break down collections and documents.
Sometimes what we encounter or ingest as a single document encapsulates a large list of items that's better organised as a collection of multiple documents.

In many cases this will depend on how we want to search for and interact with documents. 

In this case, the `products` JSON dictionary is a list that we'll break up.
We'll create a collection called products and will insert each list item as a document in our Python code.


## Loading

See `shopify_load.py` as a starting example.

Also note some of the explanations in the comments.

What happens if you run the load script more than once?


## Deleting all

If you want to clear out the (possibly duplicate) items inserted just run:

	db.products.deleteMany()


## Preventing duplicates

Although MongoDB is not a relational database, it can enforce some basic schema constraints.

There is technically a primary key of sorts in the form of the `_id` field.

We can create a *unique index* to prevent insertion of a record that already exists.
Issue the following command in `mongosh` to create a unique constraint on the combination of `store` and `handle` columns that will guarantee a unique ID. 

	db.products.createIndex( { "store": 1, "handle": 1 }, { unique: true } )

Then re-run the loading script twice and confirm that the unique index prevents duplicate insertions. 




# Pandas

We previously saw how pandas has an easy interface to read results from SQL queries.
This is quite an easy operation in theory since SQL result sets result in tables that map directly to pandas dataframes.

	import pandas as pd
	from pymongo import MongoClient
	
	# as usual up to
	
	df = pd.DataFrame(db.products.find())
	
Available columns will be filled from each document.
There will be null values if a field doesn't exist for that document.




