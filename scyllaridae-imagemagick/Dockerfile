FROM islandora/imagemagick:main@sha256:75938957ddc19998dec5022876cf258dc14d02fae337cb25a46a174b5cb0188f AS imagemagick
FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:a9f8d04a3695f0de44fbb0c5c63aac3235bcbf23b6fb6d3f5ecd1f7915aae92f

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN --mount=type=bind,from=imagemagick,source=/packages,target=/packages \
    --mount=type=bind,from=imagemagick,source=/etc/apk/keys,target=/etc/apk/keys \
    apk add --no-cache /packages/imagemagick-*.apk

RUN magick -list format | grep "JPEG-2000"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
