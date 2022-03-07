#!/usr/bin/env python3
# Print out the bathe_cat.xml file

import lxml.etree as ET

root = ET.parse('bathe_cat.xml')

print(root.xpath('/PROCEDURE/TITLE')[0].text)

print(root.xpath('/PROCEDURE/OVERVIEW')[0].text)

print('EQUIPMENT:') 
for item in root.xpath('/PROCEDURE/EQUIPMENT/ITEM'):
    print(item.text)

print('INSTRUCTIONS:')
for step in root.xpath('/PROCEDURE/INSTRUCTIONS/STEP'):
    print(step.text)

