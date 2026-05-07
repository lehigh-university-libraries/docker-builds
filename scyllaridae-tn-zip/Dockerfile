
FROM islandora/imagemagick:main@sha256:ce3c9fba43e462787831c26e6e464c4528bcca972cdd588d6e2ff5465a77438d AS imagemagick
FROM islandora/scyllaridae:6@sha256:1f650c1bff8fce4932854408454e9bc5ae76229ce1c467a6d46d0b61540d8e5a

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN --mount=type=bind,from=imagemagick,source=/packages,target=/packages \
    --mount=type=bind,from=imagemagick,source=/etc/apk/keys,target=/etc/apk/keys \
    apk add --no-cache /packages/imagemagick-*.apk \
    zip \
    ttf-liberation && \
  apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main tree

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
