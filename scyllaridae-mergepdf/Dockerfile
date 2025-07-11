FROM islandora/imagemagick:main@sha256:16f4a7e4a380e91a2a85040f53a483a080f3b1ff0066b4a01b199455ae16f0cc AS imagemagick
FROM islandora/leptonica:main@sha256:9f8a5bba06d8639fd34671696cdd4af01dfcba1e35d2aa1b621a9ca684db7e93 AS leptonica
FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:a9f8d04a3695f0de44fbb0c5c63aac3235bcbf23b6fb6d3f5ecd1f7915aae92f

ARG \
  # renovate: datasource=repology depName=alpine_3_20/tesseract-ocr
  TESSERACT_VERSION="5.3.4-r0" \
  # renovate: datasource=repology depName=alpine_3_20/jq
  JQ_VERSION="1.7.1-r0" \
  # renovate: datasource=repology depName=alpine_3_20/ghostscript
  GHOSTSCRIPT_VERSION="10.05.1-r0" \
  # renovate: datasource=repology depName=alpine_3_20/poppler-utils
  POPPLER_VERSION="24.02.0-r2"

# hadolint ignore=DL3018
RUN --mount=type=bind,from=imagemagick,source=/packages,target=/packages \
    --mount=type=bind,from=imagemagick,source=/etc/apk/keys,target=/etc/apk/keys \
    apk add --no-cache /packages/imagemagick-*.apk

RUN --mount=type=bind,from=leptonica,source=/packages,target=/packages \
    --mount=type=bind,from=leptonica,source=/etc/apk/keys,target=/etc/apk/keys \
    apk update && \
    apk add --no-cache \
        /packages/leptonica-*.apk \
        ghostscript=="${GHOSTSCRIPT_VERSION}" \
        jq=="${JQ_VERSION}" \
        tesseract-ocr=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-eng=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-fra=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-spa=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-ita=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-por=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-hin=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-deu=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-jpn=="${TESSERACT_VERSION}" \
        tesseract-ocr-data-rus=="${TESSERACT_VERSION}" \
        poppler-utils=="${POPPLER_VERSION}"

COPY . /app

ENTRYPOINT ["/app/docker-entrypoint.sh"]
