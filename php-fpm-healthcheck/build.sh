#!/usr/bin/env bash
#docker buildx build \
#--platform linux/amd64,linux/arm64/v8 \
#--push \
#--pull \
#--tag someblackmagic/docker-extra-modules:php-fpm-healthcheck-latest \
#--file Dockerfile \
#.
docker build -t someblackmagic/docker-extra-modules:php-fpm-healthcheck-latest .
docker push someblackmagic/docker-extra-modules:php-fpm-healthcheck-latest .
