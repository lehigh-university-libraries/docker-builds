FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:17b3ea02586a752473d42920b9098b9e8e395fde37b498d41e904e29c4e51353

ARG \
  # renovate: datasource=repology depName=alpine_3_22/ffmpeg
  FFMPEG_VERSION=6.1.2-r2

RUN apk update && \
    apk add --no-cache ffmpeg=="${FFMPEG_VERSION}"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
