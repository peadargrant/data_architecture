#!/usr/bin/env python3
# Route finder for London Tube
# Peadar Grant

from py2neo import Graph
from argparse import ArgumentParser

parser = ArgumentParser(description="london underground journey finder")
parser.add_argument('start', help='start station')
parser.add_argument('end', help='end station')
args = parser.parse_args()

# connect to Neo4J (on localhost)
graph = Graph("bolt://localhost:7687", auth=("neo4j", "1Password"))

# build query
query = "MATCH (origin:Station{name:'%s'}), (destination:Station{name:'%s'}) CALL apoc.algo.aStar(origin, destination,'TRAIN','time', 'latitude', 'longitude') YIELD path as path, weight as weight RETURN path, weight" % ( args.start, args.end )

# run the query
results = graph.run(query)
for result in results:
    path = result['path']
    
    # needed for flipping segment order
    segment_from = args.start
    last_line = ''
    for relationship in path.relationships:
    
        # Handle "reversed" connections
        r_from = relationship.start_node['name']
        r_to = relationship.end_node['name']
        if r_to == segment_from:
            r_to = r_from
            r_from = segment_from 
    
        # Map display print
        if relationship['line'] != last_line:
            print(r_from)
            print(' | ' + relationship['line'])
        else:
            print(' |   ' + r_from)
        if r_to == args.end:
            print(r_to)

        # Re-Set segment for next time
        segment_from = r_to
        last_line = relationship['line']
