#!/bin/bash

HOST="neo4j+s://ce5c573a.databases.neo4j.io:7687"
USERNAME="neo4j"
PASSWORD="RdKzW-YnyyRd5h1Q6OoRQUDza5edKXrmqDzSTN7QkZg"
DATABASE="neo4j"

cypher-shell -a "$HOST" -u "$USERNAME" -p "$PASSWORD" -d "$DATABASE" "match (a)-[r]-(b) delete a,r,b"
for f in ls experiments/*.cypher
do
	cat "$f" | cypher-shell -a "$HOST" -u "$USERNAME" -p "$PASSWORD" -d "$DATABASE"
done
