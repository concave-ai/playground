FROM alpine:3.19

RUN apk add --no-cache ca-certificates bind-tools tini

ENV DATA_DIR /code/index/zoekt

COPY --from=ghcr.io/concave-ai/zoket_base /usr/local/bin/zoekt-webserver /usr/local/bin/
ENV GOGC=25

ENTRYPOINT ["/sbin/tini", "--"]
CMD zoekt-webserver -index $DATA_DIR
