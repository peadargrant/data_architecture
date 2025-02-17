#!/usr/bin/env python3
# MongoDB task manager
# Peadar Grant

from pymongo import MongoClient
import configparser
import sys

config = configparser.ConfigParser()
config.read('mongodb.conf')
dbconfig=config['mongodb']

client = MongoClient(dbconfig['host'], username=dbconfig['username'], password=dbconfig['password'])
db = client.grantp

print('MongoDB Task manager')
while True:
    print('[l] to list all')
    print('[n] to create a new task')
    print('[x] to exit')
    choice = input('enter choice: ')
    print(' ')
    if 'l' == choice:
        tasks = db['tasks'].find()
        for task in tasks:
            print(task['description'])
    if 'n' == choice:
        new_task_name = input('Enter new task: ')
        db['tasks'].insert_one({'description':new_task_name, 'done': False})
        print('OK')
    if 'x' == choice:
        sys.exit(0)
    
