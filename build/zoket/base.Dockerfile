FROM golang:1.22.2-alpine3.19 AS builder

RUN apk add --no-cache ca-certificates git

ENV CGO_ENABLED=0
WORKDIR /go/src/github.com/sourcegraph
RUN git clone https://github.com/sourcegraph/zoekt.git
WORKDIR /go/src/github.com/sourcegraph/zoekt

# Cache dependencies
RUN go mod download
RUN go install -ldflags "-X github.com/sourcegraph/zoekt.Version=concave-0.0.1" ./cmd/...

FROM alpine:3.19 AS zoekt

RUN apk add --no-cache git ca-certificates bind-tools tini jansson wget

COPY --from=builder /go/src/github.com/sourcegraph/zoekt/install-ctags-alpine.sh ./install-ctags-alpine.sh
RUN ./install-ctags-alpine.sh && rm install-ctags-alpine.sh

COPY --from=builder /go/bin/* /usr/local/bin/

ENTRYPOINT ["/sbin/tini", "--"]
