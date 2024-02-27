# Basic Neo4J Cypher commands
# Peadar Grant

Notes:
- The variable name(s) let you reference the node(s) within the commmand.
- The actual variable names don't matter and exist only within the command.

# creating a node, in group Person with tags
create (n:Person {name: 'Peadar', nationality:'Irish'})
create (n:Person {name: 'Mary', nationality:'Irish'})

# show all nodes & their relationships
match (n) return n 

# match node based on attribute(s)
match (n:Person {nationality:'Irish'}) return n 
match (n:Person) where n.nationality='Irish' return n 

# create a relationship
match (a:Person {name: 'Peadar'}), (b:Person {name:'Mary'}) create (a)-[r:Friend]->(b)

# returning a particular node or set of nodes
match (n:Person) return n 
match (n {name:'Peadar'}) return n
match (n {nationality:'Irish'}) return n 

# return nodes and relationships
match (a:Person {name: 'Peadar'})-[r:Friend]->(b:Person {name:'Mary'}) return a,b,r

# delete a node
match (n:Person {name: 'Peadar'}) delete (n)

# delete a relationship
match (a:Person {name: 'Peadar'})-[r:Friend]->(b:Person {name:'Mary'}) delete (r)

