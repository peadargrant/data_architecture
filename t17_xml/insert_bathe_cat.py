#!/usr/bin/env python3
# Print out the bathe_cat.xml file

import lxml.etree as ET
from psycopg2 import connect

conn = connect(database="ec2-user")
cursor = conn.cursor()

root = ET.parse('bathe_cat.xml')
title = root.xpath('/PROCEDURE/TITLE')[0].text
overview = root.xpath('/PROCEDURE/OVERVIEW')[0].text

xml_as_string = ET.tostring(root)
print(xml_as_string)

cursor.execute("INSERT INTO procedures (document) VALUES (%s)", (root.xpath('/PROCEDURE'),))
conn.commit()

