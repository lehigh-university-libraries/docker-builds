FROM islandora/scyllaridae:6@sha256:573479dafa271f4071739408753c0ec2e8e59bd97b0f496a721e02a565d1948b

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
