FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /go/src/app
COPY . .

ARG TARGETOS

RUN make $TARGETOS

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/tgbot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./tgbot"]

