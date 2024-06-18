# Introduction

this project represents electrolyte preparation experiments with graph database.

# Usage

## install prerequisite

```shell
python3 -m pip install -r requirements.txt
```

## restore data

```shell
bash restore.sh
```

## generate experiment steps

```shell
python3 main.py --target <formula of electrolyte> [--host <host>] [--user <user>] [--password <password>] [--db <db>]
```

