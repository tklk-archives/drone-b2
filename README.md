# drone-b2

Drone plugin to publish files and artifacts to Backblaze B2. For the
usage information and a listing of the available options please take a look at
[the docs](http://plugins.drone.io/techknowlogick/drone-b2/).

## Build

Build the binary with the following commands:

```
go build
go test
```

## Docker

Build the Docker image with the following commands:

```
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo
docker build --rm=true -t techknowlogick/drone-b2 .
```

Please note incorrectly building the image for the correct x64 linux and with
CGO disabled will result in an error when running the Docker image:

```
docker: Error response from daemon: Container command
'/bin/drone-b2' not found or does not exist..
```

## Usage

Execute from the working directory:

```
docker run --rm \
  -e PLUGIN_SOURCE=<source> \
  -e PLUGIN_TARGET=<target> \
  -e PLUGIN_BUCKET=<bucket> \
  -e B2_ACCOUNT_ID=<token> \
  -e B2_APPLICATION_KEY=<secret> \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  techknowlogick/drone-b2 --dry-run
```

## Thanks

This plugin is forked form [drone-s3](https://github.com/drone-plugins/drone-s3) and changed to use Backblaze B2