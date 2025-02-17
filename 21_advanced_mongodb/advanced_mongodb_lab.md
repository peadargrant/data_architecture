% Advanced MongoDB lab

In this week's lab we'll continue our exploration of MongoDB as a document store, this time using larger datasets imported from elsewhere. 

I've given the final files in the git repository, but to get the full educational value I recommend that you work along interactively during class using `mongosh` and `ipython3`. 

We will cover many of the items both directly in `mongosh` and then via Python in `ipython3` using the `pymongo` library.
We'll also introduce the python `requests` library to pull in JSON-formatted data from internet URLs.


**Important links:**

- [MongoDB Documentation](https://www.mongodb.com/docs/)
- [PyMongo Documentation](https://www.mongodb.com/docs/languages/python/pymongo-driver/current/)
- [Python Requests Library](https://requests.readthedocs.io/en/latest/)


# Connecting

## Remote or laptop students

*Skip if on a lab machine*

[Connect to the VPN](https://dkitvpn.dkit.ie) at the beginning of this class.


## Login to the shared server

As per last week, we'll login to the shared lab server.

```bash
ssh yourname@10.200.172.60
```


## Recommended TMUX layout

This week we'll be working with both mongosh and with python in parallel.
It's recommended to begin with the following tmux layout.

Type `Ctrl-B c` to make a new tmux pane.



## Connect to mongodb server using mongosh

Now let's connect to our mongodb database from the shared lab server using `mongosh`.

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

Change to your own database using the command:

```javascript
use yourname
```	
	
Note that the prompt now changes to:

	yourname>
	
This means that commands you enter will now run against your own database instead of the `test` one.

*If you have problems connecting you need to let me know straight away.*



## Delete existing collections

To make things easier this week, let's clean out our MongoDB database.

```javascript
db.getCollectionNames().forEach(c=>db[c].drop())
```


# Python connection

We'll revise a few concepts from python connectivity from last week and introduce a few new ones.


## TMUX window for iPython3

First let's create a new TMUX window to run our interactive python session in while leaving our existing `mongosh` open and accessible.
Use `Ctrl-B c` to make a new window.

Then use `Ctrl-B 0`, `Ctrl-B 1`, `Ctrl-B 2` etc to switch between the windows.


## Running iPython

In your new TMUX window open a new `ipython3` session using

```bash
ipython3
```


## Creating the config file

Now switch to your original window in TMUX.
Similar to last week, open a file named `mongodb.conf` using `emacs` as follows:

```bash
emacs mongodb.conf
```

Edit it so that it looks like:

	[mongodb]
	host=10.200.172.57
	username=your-username-here
	password=your-mongodb-password-here
	database=your-username-here
	
Now in `iPython3` let's load it in as before:

```python
# import library
import configparser

# initialise config object
config = configparser.ConfigParser()

# load config from file
config.read('mongodb.conf')

# get the mongodb section (the only one)
dbconfig=config['mongodb']
```

## MongoDB connection

We'll follow a similar pattern to last week:

```python
# import the pymongo module
from pymongo import MongoClient

# create the client object connecting to the server
client = MongoClient(dbconfig['host'], username=dbconfig['username'], password=dbconfig['password'])

# database object from client
db = client.yourusernamehere
```


# Product database example

One thing document stores in general are very good at is storing data you've ingested from elsewhere, where you didn't design or don't know the schema in advance.
They then make it very easy to run queries against that data compared to storing it as flat files.

We're going to demonstrate this using information from a few stores that employ the [Shopify](https://shopify.com) sales platform to power their online store.

Shopify happens to provide information on products at `products.json` on every site by default.
It will return up to 250 products for a single call.


## Store list

There a few retailers I've found that use Shopify.

In `mongosh` create a new collection named `stores` (adapt the instructions above) and populate 2 of the retailers below as `name` and `url`:

1. Carraig donn: https://www.carraigdonn.com
2. Carolyn's Sweet Shop: https://www.carolynssweetshop.ie
3. SOS Cookies: https://www.soscookies.ie

When you've done this, the output from:

```javascript
db.stores.find({})
```
	
should look similar to: 


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


# Requests library

We're going to use the [Python Requests Library](https://requests.readthedocs.io/en/latest/) to allow us to get information from internet URLs directly into Python programs.
Very similar alternatives include urllib3 and beautifulsoup.

The requests library is very straightforward to use.
Import using the usual syntax.

```python
import requests
```

We can just call its `get` method against any particular URL, storing its result into the `response` variable.

```python
response = requests.get('https://url.goes/here')
```

The response object contains not only the data asked for but other information supplied (as headers) from the remote server.
The usual methods you'll use are:

```python
# works all the time
data_as_text = response.text

# directly create a dict / list if response is JSON
data_as_dictionary = response.json() 
```

Most APIs designed for programmatic access tend to return JSON, which is very straightword to parse.
Once this has been done it's just a normal python dictionary/list structure and no other special treatment is needed.

If the API does not return JSON, perhaps instead returning CSV, XML etc then there will have to be a separate parsing step using the appropriate tools based on the `.text` attribute. 

The requests library is very fully-featured, and can support a lot of other functionality like cookies, HTTP authentication, user agent masquerading, POST requests etc.


# Schema design

Although we don't need to define columns and datatypes before taking in data, we do need to decide on how to break down collections and documents.
This applies if creating a database and its contents from scratch as in the last lab, but is particularly important when we're importing data from elsewhere.

Sometimes what we encounter or ingest as a single document encapsulates a large list of items that's better organised in our database as a collection of multiple documents.

In many cases this will depend on how we want to search for and interact with documents. 

In this case, the `products` JSON dictionary is a list that we'll break up into individual products. 

We'll create a collection called products and will insert each list item as a document in our Python code.


# Loading

For the full demo example see `shopify_load_demo.py`.

Also note some of the explanations in the comments.


## Basic load program

Using the `emacs` editor you can start on the example:

```bash
emacs shopify_load.py
```


What happens if you run the load script more than once?


## Deleting all

If you want to clear out the (possibly duplicate) items inserted just run:

```javascript
db.products.deleteMany()
```

# Preventing duplicates

Like common relational Databases,  MongoDB can enforce some basic schema constraints.

There is already technically a primary key of sorts in the form of the `_id` field.
In almost all cases we should let MongoDB manage this ID by itself.

We can also create one more *unique indexes* to prevent insertion of a record that already exists, as in the case of PostgreSQL.

Issue the following command in `mongosh` to create a unique constraint on the combination of `store` and `handle` columns that will guarantee a unique ID. 

```javascript
db.products.createIndex( { "store": 1, "handle": 1 }, { unique: true } )
```

Then re-run the loading script twice and confirm that the unique index prevents duplicate insertions. 



# Limit fields to return

We can limit fields to return from a query using what we call a [projection](https://www.mongodb.com/docs/manual/tutorial/project-fields-from-query-results/).

```javascript
db.products.find({}).project({ title:1 })
```



## Suppress the ID field

The `_id` field appears even when not explicitly asked for.
It can be suppressed by including `_id` in the projection expression and setting it to `0`.

```javascript
db.products.find({}).project({ title:1, _id:0 })
```



## Exclusion

Instead of listing the desired fields, you can use a projection expression that specifies 0 on each to suppress the fields in question, otherwise returning all fields.

Confusingly, aside from the `_id` column as above we can't combine 0 and 1 clauses in this expression.

```javascript
db.products.find({}).project({ body_html:0 })
```
