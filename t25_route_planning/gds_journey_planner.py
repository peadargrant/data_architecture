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

# delete projected graph 
query = "CALL gds.graph.drop('tube')"
print('Dropping projected graph')
graph.run(query)

# project graph
query = "CALL gds.graph.project('tube', 'Station', { CONNECTION:{type:'TRAIN', orientation: 'UNDIRECTED' }}, { relationshipProperties: 'time' })"
print('Running projection...')
graph.run(query)

# build query
query = "MATCH (s:Station {name: 'Edgware'}), (t:Station {name:'Heathrow Terminal 4'}) CALL gds.shortestPath.dijkstra.stream('tube', { sourceNode: s, targetNode: t, relationshipWeightProperty: 'time' }) yield index, nodeIds, costs, totalCost, path RETURN 	index,    [nodeId IN nodeIds | gds.util.asNode(nodeId).name] AS nodeNames,     costs, 	totalCost,     nodes(path) as path ORDER BY index"


# run the query
results = graph.run(query)
for result in results:
    path = result['path']
    
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
