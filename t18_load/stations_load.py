#!/usr/bin/env python3
# Script to load stations to database

import lxml.etree as ET
import psycopg2 as pg

root = ET.parse('stations.xml')

stations = root.xpath('/stations/station')
conn = pg.connect(database='stations')
cur = conn.cursor()
query = 'INSERT INTO stations (locationX, locationY, id, standardname, name) VALUES (%s, %s, %s, %s, %s)'

for station in stations:

    # extract data from XML using XPath
    locationX = station.xpath('@locationX')[0]
    locationY = station.xpath('@locationY')[0]
    id = station.xpath('@id')[0]
    standardname = station.xpath('@standardname')[0]
    # . will give contents of current element
    name = station.xpath('./text()')[0]

    # insert data using Psycopg2
    cur.execute(query, (locationX, locationY, id, standardname, name,))
    
    print(name)

conn.commit()

