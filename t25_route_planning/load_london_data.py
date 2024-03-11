#!/usr/bin/env python3
# Create the London Underground Map in Neo4J from Python
# Peadar Grant
#
# Core idea from:
# https://neo4j.com/blog/going-underground-graphing-pathfinding-london-tube-lines/
#
# Uses the py2neo driver
# See: https://py2neo.org/2021.1/#core-graph-api for details
# Does NOT use the bulk loading features!

from py2neo import Graph, Node, Relationship, NodeMatcher
import json

# using 'with' generally better than open/close
with open('london.json','r') as input_file:
    london = json.load(input_file)

# break out the input data
stations = london['stations']
lines = london['lines']
connections = london['connections']

# connect to Neo4J (on localhost)
graph = Graph("bolt://localhost:7687", auth=("neo4j", "1Password"))

# delete existing graph in full (be careful!)
graph.delete_all()

# Insert lines
for line in lines:
    print(line)
    graph.create( Node("Line", name = line['name'], line_id = int(line['line'])))

# Insert stations
for station in stations:
    print(station)
    graph.create( Node("Station",
                       name = station['name'],
                       station_id = int(station['id']),
                       latitude = float(station['latitude']),
                       longitude = float(station['longitude'])
                 ) )
    
# Connect stations
nodes = NodeMatcher(graph)
for connection in connections:
    print(connection)

    # To do this we need to be able to reference *existing* nodes in the Graph.
    # We use our nodes (NodeMatcher) object to do this.
    
    # find 1st station
    start = nodes.match('Station', station_id=int(connection['station1'])).first()
    print(start)
    
    # find 2nd station
    end = nodes.match('Station', station_id=int(connection['station2'])).first()
    print(end)

    # find line
    line = nodes.match('Line', line_id=int(connection['line'])).first()
    print(line['name'])

    # create the relationship
    graph.create( Relationship(start, 'TRAIN', end,
                               time = int(connection['time']),
                               line = line['name']
                               ) )
    
    print(' ')
    
