
FROM islandora/imagemagick:main@sha256:8f0127e8c72998a3ec1798c044c51d4f12958b9282402727e227c7176056d869 AS imagemagick
FROM islandora/scyllaridae:6@sha256:7ce43871a331d60fcbd89201f86c4d27d3f8ad8de7d37dcb3d70a103e063cb73

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
