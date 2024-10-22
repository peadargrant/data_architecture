#!/usr/bin/env python3

# psycopg library renamed to make shorter
import psycopg2 as pg
# needed to use DictCursor
import psycopg2.extras

# connect to DB on local server
conn = pg.connect(database='france')

# Psycopg2 can handle multiple concurrent queries (and their results).
# For this reason each operation must go through a cursor.
cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
# NOT the same as server-side cursors which we will meet later.

# Query as a string
query = "SELECT id, name FROM regions ORDER BY name ASC"

# Execute the query
cur.execute(query)

# Can see the number of rows returned
print("number of regions: %s" % cur.rowcount)

# Loop over each row
for row in cur:

    # Access by column name in dict
    print("%s. %s" % (row['id'], row['name']))

# optional: rewind the cursor (if we want to use it again)
cur.scroll(0, 'absolute')
    
# Close the cursor and connection
cur.close()
conn.close()
