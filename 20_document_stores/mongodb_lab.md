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

```bash
ssh yourname@10.200.172.60
```

## Connect to mongodb server using mongosh

In today's lab we are going to use a shared mongodb instance.
Unlike Postgres, the MongoDB instances is provisioned on a separate Dell R230 server running Linux in the same rack in P1153.

MongoDB has its own username / password database (and can be configured for single sign-on but not here).
All students have been provisioned with a mongodb user with the same name as yourself and initial MongoDB password `1Password`.

Instead of logging into the MongoDB server over SSH directly, we will use the `mongosh` client on the shared server to connect remotely using MongoDB's own protocol to the mongod instance.

```bash
mongosh --host 10.200.172.57  -u yourusername
```

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

```javascript
use yourname
```	
	
Note that the prompt now changes to `yourname>`, meaning that commands you enter will now run against your own database instead of the `test` one.
	
Confusingly, MongoDB's authorization system allows you to connect to any database in the system, whether you have rights on that database or not.
It will only block when you actually try to do something you're not authorized to do.
To ensure that you have access rights to your own database, we're going to run a command that will cause an error if you don't have the right access levels:

```javascript
show collections
```

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

```javascript
db.tasks.insertOne( { description: "wash the dishes", done: false } )
```

The `db` object represents the database and is always in scope.
Most mongodb commands operate on the `db` object.


### Listing out all collections

Now that our collection has been created, it will appear in the list of collections:

```javascript
show collections
```


### Listing out all contents in the collection

We can get all items in a collection once we know its name using the `find` method:

```javascript
db.tasks.find()
```

### Adding more data

We can obviously call `insertOne` as many times as we like. 

```javascript
db.tasks.insertOne( { description: "mow the lawn", done: false } )
db.tasks.insertOne( { description: "call the electrician", done: false, note: "ask about discount" } )
```

Now insert a few extra tasks into your collection.


## Querying

As with SQL, more advanced queries are best learned on an as-needed basis.
There are a few key building blocks that we'll study now, continuing on with our task manager example.

We already know that calling the `find()` method will get all items in that collection.
By adding arguments to the `find()` method in the form of JSON we can narrow down the search.


### Does a field exist?

Given that documents are free-format, we may want to include/exclude items based on whether a particular field exists or not. 

```javascript
db.tasks.find( { "note": { "$exists": true } } )
```

### Nullity

More confusingly, a field can exist / not exist, but it can also be null or have a value.
Let's try an insertion like:

```javascript
db.tasks.insertOne( { description: "call the plumber", done: false, note: null } )
```
	
If we now re-run the previous example:

```javascript
db.tasks.find( { "note": { "$exists": true } } )
```	
	
We'll now see that the null valued field does exist.
Given that by default MongoDB has no schema checking or enforcement, this confusion could get out of hand if we're not disciplined in our usage.
If we wanted to find records where the field has a non-null value we can instead use: 

```javascript
db.tasks.find( { note: { $ne: null } } )
```
	
Of course our problem of interest will determine how we should handle field existence and nullity.


### Combining criteria

We can combine criteria for a single field thus:

```javascript
db.tasks.find( { note: { $exists: true, "$eq": 'ask about discount' } })
```

The criteria we include are a logical AND to produce the output documents.


# Python connectivity

As we've seen with PostgreSQL, databases are most useful when we connect them directly with our own Python (or other) code.
This bring rich capabilities in terms of data visualisation, loading and analysis.


## PyMongo

The `pymongo` library provides connectivity from Python to MongoDB and allows us to manipulate the returned results in a reasonably Pythonic style.
`pymongo` is installed on the shared server, so imported as:

```python
from pymongo import MongoClient
```


## Username / password

When using our own code we still need to authenticate to the database server, meaning that our program access to our credentials.

It's generally a bad idea (but happens all too often) to hard-code credentials in program code.

### Config file

Let's create a config file to store the values using the common INI format that Python supports to store these.
The config file format has sections in square brackets, with each entry being a key mapping to a value.

Create a file called `mongodb.conf` using `emacs` with the following content:

	[mongodb]
	host=10.200.172.57
	username=your-username-here
	password=your-mongodb-password-here

If you're using source control like Git, **don't commit them** to your repository.


### Reading credentials

We can then use the `configparser` module in Python to read this information.

```python
config = configparser.ConfigParser()
config.read('mongodb.conf')
dbconfig=config['mongodb']
```





# Pandas

We previously saw how pandas has an easy interface to read results from SQL queries.
This is quite an easy operation in theory since SQL result sets result in tables that map directly to pandas dataframes.

```python
import pandas as pd
from pymongo import MongoClient
	
# as usual up to
	
df = pd.DataFrame(db.products.find())
```

Available columns will be filled from each document.
There will be null values if a field doesn't exist for that document.




