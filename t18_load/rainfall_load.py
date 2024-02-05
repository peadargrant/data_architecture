import pandas as pd
import psycopg2 as pg

conn = pg.connect(database='rainfall')
cur = conn.cursor()
query = 'INSERT INTO rainfall (east, north, year, month, rainfall) VALUES (%s, %s, %s, %s, %s)'


df = pd.read_csv('rainfall.csv')

def year_month_for_column(column):
    year=int(column[2:5])
    month=int(column[5:7])
    return(year,month)

columns = df.columns
rows = df.to_dict(orient='records')

for row in rows:
    north = row['north']
    east = row['east']
    print('north=%s east=%s' % (north,east))
    
    for column in columns:
        if not column.startswith('X'):
            continue
        
        (year, month) = year_month_for_column(column)
        value = row[column]
        
        print('    %s %s %s' % (year, month, value))
        cur.execute(query, (north, east, year, month, value))

conn.commit()

