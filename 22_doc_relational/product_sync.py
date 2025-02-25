#!/usr/bin/env python3
# Product sync example
# Peadar Grant

import psycopg2
from psycopg2.extras import DictCursor
from psycopg2.errors import UniqueViolation
from psycopg2.extras import Json
from psycopg2.extensions import register_adapter
import json
import sys
import requests

register_adapter(dict, Json)

# connect to DB, defaults are:
# host = localhost
# username = system username
# database = same as system username
# password = blank [ok as trust auth on same name on local host]
db = psycopg2.connect()

cur = db.cursor(cursor_factory=DictCursor)

# stores list from JSON file
with open('stores.json','r') as stores_file:
    stores_list = json.load(stores_file)

    
# delete existing data (so we start from a clean sheet)
cur.execute('DELETE FROM store')
cur.execute('ALTER SEQUENCE store_id_seq RESTART WITH 1')
cur.execute('ALTER SEQUENCE product_id_seq RESTART WITH 1')
cur.execute('ALTER SEQUENCE variant_id_seq RESTART WITH 1')


# insertion query text (using named placeholders in SQL)
store_query = 'INSERT INTO store ( name, url ) VALUES ( %(name)s, %(url)s ) returning id'
product_query = 'INSERT INTO product ( store, record ) VALUES ( %(store_id)s, %(record)s ) returning id'
variant_query = 'INSERT INTO variant ( product, record ) VALUES ( %(product_id)s, %(record)s ) returning id'

# second cursor so we don't lose position in stores cursor
product_cur = db.cursor(cursor_factory=DictCursor)

for store in stores_list:

    # insert the store
    print(store['name'])
    cur.execute(store_query, store)
    store_id = cur.fetchone()['id']

    catalogue = requests.get('%s/products.json' % (store['url'],)).json()['products']


    for product in catalogue:        
        product_cur.execute(product_query, {'store_id': store_id, 'record': product})
        product_id = product_cur.fetchone()['id']

        for variant in product['variants']:
            product_cur.execute(variant_query, {'product_id': product_id, 'record': variant})
    
db.commit()
sys.exit(0)

