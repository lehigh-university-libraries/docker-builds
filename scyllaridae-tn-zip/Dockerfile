
FROM islandora/imagemagick:main@sha256:88b0fcc6bb26b81bfc27b8c92bcc2f2759b78be2149acfc80112eb3a0f78cee0 AS imagemagick
FROM islandora/scyllaridae:6@sha256:573479dafa271f4071739408753c0ec2e8e59bd97b0f496a721e02a565d1948b

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
