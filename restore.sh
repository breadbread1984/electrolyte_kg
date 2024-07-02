#!/bin/bash

HOST="bolt://localhost:7687"
USERNAME="neo4j"
PASSWORD="neo4j"
DATABASE="neo4j"

cypher-shell -a "$HOST" -u "$USERNAME" -p "$PASSWORD" -d "$DATABASE" "match (a)-[r]-(b) delete a,r,b"
for f in ls experiments/*.cypher
do
	cat "$f" | cypher-shell -a "$HOST" -u "$USERNAME" -p "$PASSWORD" -d "$DATABASE"
done
