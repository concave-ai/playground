FROM python:3.11-alpine3.19

RUN apk add --no-cache ca-certificates bind-tools tini git jansson nodejs npm

RUN npm install -g @sourcegraph/scip-python
COPY --from=ghcr.io/concave-ai/zoket_base \
    /usr/local/bin/universal-* \
    /usr/local/bin/zoekt-* \
    /usr/local/bin/

ENTRYPOINT ["ash"]