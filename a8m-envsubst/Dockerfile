FROM alpine AS builder

RUN set -eux \
    && apk upgrade --available \
    && apk add curl \
    && true

RUN set -eux \
    && ARCH=$(uname -m) \
    && [ "$ARCH" = "aarch64" ] && ARCH="arm64" || true \
    && curl -L https://github.com/a8m/envsubst/releases/download/v1.4.2/envsubst-`uname -s`-$ARCH -o envsubst \
    && chmod +x envsubst \
    && mv envsubst /usr/local/bin

FROM scratch
COPY --from=builder /usr/local/bin/envsubst /usr/local/bin/envsubst
