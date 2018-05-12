#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

docker push techknowlogick/drone-b2:latest
docker tag techknowlogick/drone-b2:latest techknowlogick/drone-b2:1
docker tag techknowlogick/drone-b2:latest techknowlogick/drone-b2:1.2
docker push techknowlogick/drone-b2:1
docker push techknowlogick/drone-b2:1.2
docker push techknowlogick/drone-b2:linux-arm
docker push techknowlogick/drone-b2:linux-arm64