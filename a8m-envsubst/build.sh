#!/usr/bin/env bash
docker buildx create --name multiarch-builder --bootstrap --platform linux/amd64,linux/arm64/v8

docker buildx build \
--platform linux/amd64,linux/arm64/v8 \
--builder multiarch-builder \
--push \
--pull \
--tag someblackmagic/docker-extra-modules:a8m-envsubst-v1.4.2 \
--file Dockerfile \
.
#docker build -t someblackmagic/docker-extra-modules:a8m-envsubst-v1.4.2 .
#docker push someblackmagic/docker-extra-modules:a8m-envsubst-v1.4.2
