// Path finding commands
// Peadar Grant

// need the Graph Data Science plugin installed
// also seem to need server (or Cypher) restart!

// Graph projection 
// like a materialised view
CALL gds.graph.project('travel', 'Station', 'Train', { relationshipProperties: 'distance' })
// where:
// 'mygraph' is the name for the projected graph in the catalog
// 'Station' is the type of node
// 'Train' is the type of relationship


// Alternative form:
CALL gds.graph.project('travel', '*', '*', { relationshipProperties: 'distance' })
// where all Nodes and Relationships included in the projection

// Projection that turns ALL relationships into undirected ones
CALL gds.graph.project('travel', '*', { CONNECTION:{type:'*', orientation: 'UNDIRECTED' }}, { relationshipProperties: 'distance' })

// Dropping a projection
CALL gds.graph.drop('travel')

// Pathfinding using Dikjstra's algorithm
// from:
//  https://neo4j.com/docs/graph-data-science/current/algorithms/dijkstra-source-target/
MATCH (s:Station {name: 'Connolly'}), (t:Station {name:'Belfast'})
CALL gds.shortestPath.dijkstra.stream('travel', { sourceNode: s, targetNode: t, relationshipWeightProperty: 'distance' }) yield index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN
    index,
    gds.util.asNode(sourceNode).name AS sourceNodeName,
    gds.util.asNode(targetNode).name AS targetNodeName,
    totalCost,
    [nodeId IN nodeIds | gds.util.asNode(nodeId).name] AS nodeNames,
    costs,
    nodes(path) as path
ORDER BY index

