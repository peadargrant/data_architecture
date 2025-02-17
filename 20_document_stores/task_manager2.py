#!/usr/bin/env python3
# Task manager
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

while True:
    print('Tasks to be done')

    tasks = list(db.tasks.find({'done': False}))

    index = 0
    for task in tasks:
        print('[%s] %s' % ( index, task['description'],))
        index = index + 1

    entry = input('Enter task number to complete, or n for a new task: ')

    if 'n' == entry:
        new_task = {
            'description': input('enter description: '),
            'done': False
            }
        db.tasks.insert_one(new_task)
        print('task created')
        continue
    else:
        task_to_complete = tasks[int(entry)]
        db.tasks.update_one(task_to_complete, {'$set': {'done': True}  })
        print('task completed')

