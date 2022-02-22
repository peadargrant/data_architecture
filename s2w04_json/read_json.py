import json
from psycopg2 import connect

conn = connect("dbname=ec2-user")
cursor = conn.cursor()

description = input('Enter task description: ')

extra_data = {}
while True:
    key = input('Enter extra field name: ')
    if ( '' == key ):
        break
    value = input('Enter extra field value: ')
    extra_data[key] = value

print(json.dumps(extra_data))

cursor.execute('INSERT INTO tasks (description, extra_data) VALUES (%s, %s)', ( description, json.dumps(extra_data), ))

conn.commit()
