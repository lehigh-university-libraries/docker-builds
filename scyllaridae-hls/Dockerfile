FROM islandora/scyllaridae:6@sha256:0b9ec5d134d8da39a1a8326ee781faa5450022b2b1d9ad43f68530009d835984

ARG \
  # renovate: datasource=repology depName=alpine_3_22/ffmpeg
  FFMPEG_VERSION=6.1.2-r2 \
  # renovate: datasource=repology depName=alpine_3_22/jq
  JQ_VERSION=1.8.2-r0

RUN apk update && \
    apk add --no-cache \
      ffmpeg=="${FFMPEG_VERSION}" \
      jq=="${JQ_VERSION}"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
