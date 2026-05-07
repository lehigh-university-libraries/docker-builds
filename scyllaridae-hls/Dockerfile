FROM islandora/scyllaridae:6@sha256:1f650c1bff8fce4932854408454e9bc5ae76229ce1c467a6d46d0b61540d8e5a

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
