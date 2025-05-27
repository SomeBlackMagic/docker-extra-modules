FROM alpine AS builder

RUN set -eux \
    && apk upgrade --available \
    && apk add curl git \
    && true

USER root
WORKDIR /

COPY <<EOF .gitignore
/proc
/sys
/dev
/run
/tmp
/etc
/root
/var
EOF

RUN set -eux \
    && git config --global init.defaultBranch master \
    && git config --global --add safe.directory / \
    && git config --global user.email "root@localhost"  \
    && git config --global user.name "root" \
    && git init \
    && git add . \
    && git commit -m "core" \
    && true

RUN set -eux \
    && curl https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck > /usr/local/bin/php-fpm-healthcheck \
    && chmod +x /usr/local/bin/php-fpm-healthcheck \
    && apk add fcgi busybox grep \
    && true

RUN set -eux \
    # Installation: Generic
    # Type:         Built-in extension
    && (git ls-files --others --exclude-standard; git diff --name-only --cached --diff-filter=A) | sort -u | while IFS= read -r file; do cp -v --parents "/${file}" /opt; done \
    && true

FROM scratch
COPY --from=builder /opt /
