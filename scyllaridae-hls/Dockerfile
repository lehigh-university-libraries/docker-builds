FROM islandora/scyllaridae:6@sha256:15cd75ac369601c61d22e6b85342cb05bd8361fdcd552dac3825fec0ac8819e8

ARG \
  # renovate: datasource=repology depName=alpine_3_22/ffmpeg
  FFMPEG_VERSION=6.1.2-r2 \
  # renovate: datasource=repology depName=alpine_3_22/jq
  JQ_VERSION=1.8.1-r0

RUN apk update && \
    apk add --no-cache \
      ffmpeg=="${FFMPEG_VERSION}" \
      jq=="${JQ_VERSION}"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
