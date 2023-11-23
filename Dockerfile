FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /go/src/app
COPY . .

ARG TARGETOS=windows
ARG TARGETARCH=amd64

RUN make build TARGETOS=${TARGETOS} TARGETARCH=${TARGETARCH}

FROM scratch as linux
WORKDIR /
COPY --from=builder /go/src/app/bin/* .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs
ENTRYPOINT [ "./tgbot" ]

FROM scratch as windows
WORKDIR /
COPY --from=builder /go/src/app/bin/* .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs
ENTRYPOINT [ "./tgbot.exe" ]

FROM scratch as darwin
WORKDIR /
COPY --from=builder /go/src/app/bin/* .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs
ENTRYPOINT [ "./tgbot" ]

