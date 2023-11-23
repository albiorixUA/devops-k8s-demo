APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=albiorixua
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS:=windows
TARGETARCH:=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0  GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o tgbot -ldflags "-X="github.com/albiorixUA/devops-k8s-demo/cmd.appVersion=${VERSION}

image:
	docker build  --target=${TARGETOS} --build-arg TARGETOS=${TARGETOS} TARGETARCH=${TARGETARCH} . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf tgbot
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}