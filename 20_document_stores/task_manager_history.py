 2/1: Exit
 5/1: import as pd
 5/2: import pandas as pd
 5/3: ?pd
 6/1: print('hello world')
 6/2: ?
 7/1: import
 7/2: import pandas as pd
 7/3: from pymongo import MongoClient
 7/4: client = MongoClient('10.200.172.57', username='grantp', password='Biffo191')
 7/5: db = client.grantp
 7/6: db
 7/7: db.products.findAll()
 7/8: db.products.find
 7/9: db.products.find()
7/10: df = pd.DataFrame(db.products.find())
7/11: df
7/12: df | more
7/13: df
7/14: df[1:10]
7/15: df[1:10]
 8/1: students = []
 8/2: student = { "name": "John", age:10 }
 8/3: student = { "name": "John", 'age':10 }
 8/4: students.append(student)
 8/5: student = { "name": "Mary", 'age':11 }
 8/6: students.append(student)
 8/7: students
 8/8: { 'students': students }
 8/9: { 'students': students, 'year':4 }
8/10: import json
8/11: help(json)
8/12: course_data = { 'students': students, 'year':4 }
8/13: json.dumps(course_data)
8/14:
with open('course_data.json','w') as f: 
    json.dump(course_data, f)
8/15: help(json.dumps)
8/16: json.dumps(course_data, indent=4)
8/17: print(json.dumps(course_data, indent=4))
 9/1: import json
 9/2:
with open('course_data.json','r') as f:
    course_data=json.load(f)
 9/3: course_data
   1: import configparser
   2: config = configparser.ConfigParser()
   3: config.read('mongodb.conf')
   4: dbconfig=config['mongodb']
   5: from pymongo import MongoClient
   6: client = MongoClient(dbconfig['host'], username=dbconfig['username'], password=dbconfig['password'])
   7: db = client.grantp
   8: tasks = db['tasks']
   9: tasks
  10:
for task in tasks:
    print(task)
  11: tasks = db['tasks'].find()
  12:
for task in tasks:
    print(task)
  13: import pandas as pd
  14: df = pd.DataFrame(db.tasks.find())
  15: df
  16: %history -g -f task_manager_history.py
