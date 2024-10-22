# psycopg2 needed for connection}
import psycopg2 as pg
conn = pg.connect(database="yourname")

# import pandas
import pandas as pd

# retrieve query as pandas frame
df = pd.read_sql_query('SELECT * FROM tasks', conn)

# then use dataframe like any other

    
