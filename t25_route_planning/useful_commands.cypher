// Useful Cypher commands for this exercise

// return all nodes
MATCH (m) return m

// returning all nodes and relationships
MATCH p()-[]->() return p

// return nodes with more than 1 relationship (of any type)
MATCH ()-[r]->(n)
WITH n, count(r) as rel_cnt
WHERE rel_cnt > 1
RETURN n;

// return nodes with more than 1 relationship of type 'has'
MATCH ()-[r:has]->(n)
WITH n, count(r) as rel_cnt
WHERE rel_cnt > 1
RETURN n;

// Useful Cypher commands for London Underground example
// Peadar Grant

// General Cypher commands

// delete all data in BD
MATCH (n) DETACH DELETE n

// increase nodes displayed
:config initialNodeDisplay: 1000
// this is like a PostgreSQL client command like \d \q etc.


// Commands for London Tube example

// show stations linked
match path = (:Station {name: 'Liverpool Street'})-[]-(:Station) RETURN path

// show a tube line
match path = (a:Station)-[:NORTHERN]-(b:Station) RETURN path

// dijkstra (from APOC)
MATCH (origin:Station{name:'Edgware'}), (destination:Station{name:'Stratford'})
CALL apoc.algo.dijkstra(origin,destination,'TRAIN','time')
YIELD path as path, weight as weight
RETURN path, weight

// A* (from APOC)
MATCH (origin:Station{name:'Edgware'}), (destination:Station{name:'Stratford'})
CALL apoc.algo.aStar(origin, destination,'TRAIN','time', 'latitude', 'longitude')
YIELD path as path, weight as weight
RETURN path, weight

// Projection (from GDSL)
CALL gds.graph.project('tube', 'Station', { CONNECTION:{type:'TRAIN', orientation: 'UNDIRECTED' }}, { relationshipProperties: 'time' })

// Dijkstra's algorithm from GDSL
MATCH (s:Station {name: 'Edgware'}), (t:Station {name:'Heathrow Terminal 4'})
CALL gds.shortestPath.dijkstra.stream('tube', { sourceNode: s, targetNode: t, relationshipWeightProperty: 'time' }) yield index, nodeIds, costs, totalCost, path
RETURN
	index,
    [nodeId IN nodeIds | gds.util.asNode(nodeId).name] AS nodeNames,
    costs,
	totalCost,
    nodes(path) as path
ORDER BY index