#!/usr/bin/env python3
# Load shopify product JSON to MongoDB 
# Peadar Grant

from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError
import requests
import configparser

print('loading information from store')

# load config from file
config = configparser.ConfigParser()
config.read('mongodb.conf')
dbconfig=config['mongodb']

# client object to the **instance**, not a particular database
client = MongoClient(dbconfig['host'], username=dbconfig['username'], password=dbconfig['password'])

# database is an attribute of the client object
db = client.grantp

stores_collection=db['stores']
products_collection=db['products']
stores = stores_collection.find({})
for store in stores:
    print(store)

    # use the inbuilt JSON decoder and get the 'products' dictionary
    products = requests.get(store['url'] + '/products.json').json()['products']

    # loop over each product
    for product in products:

        # inject the store name so it'll get stored in our DB
        product['store'] = store['name']

        # generate a reference
        product['ref'] = '%s/%s' % ( store['name'], product['id'], )
        
        print(product)

        # we can just use the inert_one method on the products_collection
        try:
            products_collection.insert_one(product)
        except DuplicateKeyError:
            print('duplicate item ignored')
        # unlike on mongosh, this won't automatically echo any output to
        # the screen

        print(' ')



