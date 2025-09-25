FROM islandora/imagemagick:alpine-3.22 AS imagemagick
FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:17b3ea02586a752473d42920b9098b9e8e395fde37b498d41e904e29c4e51353

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN --mount=type=bind,from=imagemagick,source=/packages,target=/packages \
    --mount=type=bind,from=imagemagick,source=/etc/apk/keys,target=/etc/apk/keys \
    apk add --no-cache /packages/imagemagick-*.apk

RUN magick -list format | grep "JPEG-2000"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
