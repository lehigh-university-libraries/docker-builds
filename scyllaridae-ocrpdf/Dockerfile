FROM islandora/imagemagick:main@sha256:f0f744eb27a9a6b11bd315a81389d0925cc0850a48089104e09d43ebcc0b29df AS imagemagick
FROM islandora/leptonica:main@sha256:0b1c7f8cf33634ae95352833cc2e90352f41ebdb20b4ca0e7f08884330bed718 AS leptonica
FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:e962c522e49dd48afc11792b89505895ab29a37044ea95591881e299f856c27e

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
