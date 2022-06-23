FROM golang:1.14-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git

WORKDIR /go/go-opera
COPY . .

ARG GOPROXY
RUN go mod download
RUN make opera

FROM alpine:latest

RUN apk add --no-cache ca-certificates

RUN /bin/sh -c set -eux     && mkdir /opt/genesis     && mkdir /root/.opera     && mkdir /root/keystore     && mkdir /root/config     && cd /opt/genesis     && wget -O mainnet.g https://download.fantom.network/mainnet-5577-pruned-mpt.g     && wget -O testnet.g https://download.fantom.network/testnet-2458-pruned-mpt.g

COPY --from=builder /go/go-opera/build/opera /

EXPOSE 5050 18545 18546 18547 19090

ENTRYPOINT ["/opera"]
