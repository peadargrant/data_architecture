#!/usr/bin/env python3
# Route planner for tube

from py2neo import Graph, Node, Relationship, NodeMatcher

graph = Graph("bolt://localhost:7687", auth=("neo4j", "1Password"))

start_name = input('Enter start station: ')
end_name = input('Enter end station: ')

