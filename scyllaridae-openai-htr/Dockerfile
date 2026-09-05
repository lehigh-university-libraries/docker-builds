FROM islandora/imagemagick:main@sha256:0d64bd6b51ad5e1ea3fc14af1ab058610fdfc1722962e0fd632ce29e6d3bcc2b AS imagemagick
FROM islandora/scyllaridae:6@sha256:0b9ec5d134d8da39a1a8326ee781faa5450022b2b1d9ad43f68530009d835984

ARG \
  # renovate: datasource=repology depName=alpine_3_22/jq
  JQ_VERSION=1.8.2-r0

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
