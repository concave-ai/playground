FROM python:3.11-alpine3.19

RUN apk add --no-cache ca-certificates bind-tools tini git jansson

COPY --from=ghcr.io/concave-ai/zoket_base \
    /usr/local/bin/universal-* \
    /usr/local/bin/zoekt-sourcegraph-indexserver \
    /usr/local/bin/zoekt-archive-index \
    /usr/local/bin/zoekt-git-index \
    /usr/local/bin/zoekt-merge-index \
    /usr/local/bin/

ENTRYPOINT ["/sbin/tini", "--", "zoekt-git-index"]
