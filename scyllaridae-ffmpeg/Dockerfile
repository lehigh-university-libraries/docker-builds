FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:a9f8d04a3695f0de44fbb0c5c63aac3235bcbf23b6fb6d3f5ecd1f7915aae92f

ARG \
  # renovate: datasource=repology depName=alpine_3_20/ffmpeg
  FFMPEG_VERSION="6.1.1-r8"

RUN apk update && \
    apk add --no-cache ffmpeg=="${FFMPEG_VERSION}"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
