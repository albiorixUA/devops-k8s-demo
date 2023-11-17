APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=albiorixua
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=windows
ARCH=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0  go build -v -o tgbot -ldflags "-X="github.com/albiorixUA/devops-k8s-demo/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${ARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${ARCH}

clean:
	rm -rf tgbot