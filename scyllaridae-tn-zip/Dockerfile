
FROM islandora/imagemagick:main@sha256:d9fe60f2cb43daf531cc764612eb710f3a92643136e15c2e821d5deb370805b1 AS imagemagick
FROM islandora/scyllaridae:6@sha256:4a45cf205eb89eb3fb420aed8f7d9066b28c5f5cfd8931505c673c4d45e15d23

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
