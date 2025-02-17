#!/usr/bin/env python3
# Load shopify product JSON to MongoDB 
# Peadar Grant

from pymongo import MongoClient
import configparser

# load config from file
config = configparser.ConfigParser()
config.read('mongodb.conf')
dbconfig=config['mongodb']

# client object to the **instance**, not a particular database
client = MongoClient(dbconfig['host'], username=dbconfig['username'], password=dbconfig['password'])

# database is an attribute of the client object
db = client.grantp

for task in db.tasks.find():
    print(task)


