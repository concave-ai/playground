
## Create new example

## Build Index

```bash

# full text search / zoket
docker run -it -v $(pwd)/pytest/6a3ac51ee2350d5072fdd082040e7cfa22331fc0:/code -w /code ghcr.io/concave-ai/index

zoekt-index -index ./index/zoekt ./src
cd /code/src
pip install -e .
scip-python index . --project-name=pytest

mkdir -p /code/index/scip && cp /code/src/index.scip /code/index/scip && rm -f index.scip
```

## Search Index

```bash
docker run -it -p 6070:6070 -v $(pwd)/pytest/6a3ac51ee2350d5072fdd082040e7cfa22331fc0:/code  ghcr.io/concave-ai/zoket-web

```