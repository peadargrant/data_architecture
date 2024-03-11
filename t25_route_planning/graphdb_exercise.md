# Transport planning exercise


## Preparation

1. Ensure your have Neo4J installed on your own / the lab computer.

2. Install the APOC & GDSL plugin (if not already enabled).

3. Install the py2neo python modules.

4. Make sure your Neo4J instance is running. 


## London Tube

1. Delete all nodes in your DB using Cypher.

2. Use the loader program to load data to your Neo4J instance.


## Familiarisation

Write appropriate Cypher queries to:

1. Count the number of Station nodes.

2. Count the number of Line nodes.

3. Count the number of TRAIN relationships. 


## Route planning

1. Use the tube map to plan at least 3 routes. 

2. Manually issue the Cypher commands to plan the 3 routes using APOC. 

3. Repeat the processing using the GDSL methods from last week. 


## Route Planner

1. Write a Python program to accept the names of the "from" and "to" stations and display the route as each hop. 

4. Modify your Python program to summarise the journey from / to stations. 


