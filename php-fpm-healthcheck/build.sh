#!/usr/bin/env bash
#docker buildx build \
#--platform linux/amd64,linux/arm64/v8 \
#--push \
#--pull \
#--tag someblackmagic/docker-extra-modules:php-fpm-healthcheck-latest \
#--file Dockerfile \
#.
docker build -f musl.Dockerfile -t someblackmagic/docker-extra-modules:php-fpm-healthcheck-musl-latest .
docker push someblackmagic/docker-extra-modules:php-fpm-healthcheck-musl-latest

docker build -f glibc.Dockerfile -t someblackmagic/docker-extra-modules:php-fpm-healthcheck-glibc-latest .
docker push someblackmagic/docker-extra-modules:php-fpm-healthcheck-glibc-latest
