FROM golang:1.11-alpine3.7 AS build-env

#Build deps
RUN apk --no-cache add build-base git

#Setup repo
COPY . ${GOPATH}/src/github.com/techknowlogick/drone-b2
WORKDIR ${GOPATH}/src/github.com/techknowlogick/drone-b2

ENV GODEBUG=netdns=go
ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=0

# TODO: add build number into binary
# -ldflags "-X main.build=${DRONE_BUILD_NUMBER}"

RUN go build -a -tags netgo -o drone-b2

FROM alpine:3.9
LABEL maintainer="hello@techknowlogick.com"

RUN apk --no-cache add \
    ca-certificates 

COPY --from=build-env /go/src/github.com/techknowlogick/drone-b2/drone-b2 /bin/drone-b2
ADD contrib/mime.types /etc/

ENTRYPOINT ["/bin/drone-b2"]
