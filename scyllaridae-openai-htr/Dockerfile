FROM islandora/imagemagick:main@sha256:d9fe60f2cb43daf531cc764612eb710f3a92643136e15c2e821d5deb370805b1 AS imagemagick
FROM islandora/scyllaridae:6@sha256:4a45cf205eb89eb3fb420aed8f7d9066b28c5f5cfd8931505c673c4d45e15d23

ARG \
  # renovate: datasource=repology depName=alpine_3_22/jq
  JQ_VERSION=1.8.1-r0

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN --mount=type=bind,from=imagemagick,source=/packages,target=/packages \
    --mount=type=bind,from=imagemagick,source=/etc/apk/keys,target=/etc/apk/keys \
    apk add --no-cache /packages/imagemagick-*.apk \
      jq=="${JQ_VERSION}"

RUN magick -list format | grep "JPEG-2000"

ENV OPENAI_MODEL=gpt-4o-mini \
    PROMPT="Transcribe this image that contains handwritten text. Include all text you see in the image. In your response, say absolutely nothing except the text from the image." \
    MAX_TOKENS=300

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
