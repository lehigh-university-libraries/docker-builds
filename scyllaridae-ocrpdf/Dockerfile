FROM islandora/imagemagick:main@sha256:0d64bd6b51ad5e1ea3fc14af1ab058610fdfc1722962e0fd632ce29e6d3bcc2b AS imagemagick
FROM islandora/leptonica:main@sha256:09fa139e2b3ecae48579edd7a4c973b8fb73a535581ce41aa8031e4d25df96fe AS leptonica
FROM islandora/scyllaridae:6@sha256:0b9ec5d134d8da39a1a8326ee781faa5450022b2b1d9ad43f68530009d835984

ARG \
  # renovate: datasource=repology depName=alpine_3_22/tesseract-ocr
  TESSERACT_VERSION=5.5.0-r2 \
  # renovate: datasource=repology depName=alpine_3_22/jq
  JQ_VERSION=1.8.2-r0 \
  # renovate: datasource=repology depName=alpine_3_22/ghostscript
  GHOSTSCRIPT_VERSION=10.05.1-r0 \
  # renovate: datasource=repology depName=alpine_3_22/poppler-utils
  POPPLER_VERSION=25.04.0-r0

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
