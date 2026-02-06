FROM islandora/imagemagick:main@sha256:d9fe60f2cb43daf531cc764612eb710f3a92643136e15c2e821d5deb370805b1 AS imagemagick
FROM islandora/leptonica:main@sha256:771e205e4ed7b241478c8f1ef133fef4f6b41d0cc7acd3331aa328a3d8a04afc AS leptonica
FROM islandora/scyllaridae:6@sha256:4a45cf205eb89eb3fb420aed8f7d9066b28c5f5cfd8931505c673c4d45e15d23

ARG \
  # renovate: datasource=repology depName=alpine_3_22/tesseract-ocr
  TESSERACT_VERSION=5.5.0-r2 \
  # renovate: datasource=repology depName=alpine_3_22/jq
  JQ_VERSION=1.8.1-r0 \
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

ENTRYPOINT ["/app/docker-entrypoint.sh"]
