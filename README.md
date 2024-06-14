# Introduction

this project represents electrolyte preparation experiments with graph database.

# Usage

## restore data

```shell
cat experiment1.cypher | cypher-shell -a neo4j://localhost:7687 -u <username> -p <password> -d <database>
cat experiment2.cypher | cypher-shell -a neo4j://localhost:7687 -u <username> -p <password> -d <database>
cat experiment3.cypher | cypher-shell -a neo4j://localhost:7687 -u <username> -p <password> -d <database>
```

## test experiment instruction generation

```shell
python3 instructions.py
```
