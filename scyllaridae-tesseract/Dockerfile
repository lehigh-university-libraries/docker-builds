FROM islandora/imagemagick:alpine-3.22@sha256:43840f6f422f9d75928e5ae4c87dd8a6926ca95b6b12274fb34fa204f75e1a65 AS imagemagick
FROM islandora/leptonica:alpine-3.22@sha256:9cb25b36d30cd9196a5c7040c47afa15afc73ed9d3bfe6472d9c03bc731cb9d6 AS leptonica
FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:17b3ea02586a752473d42920b9098b9e8e395fde37b498d41e904e29c4e51353

ARG \
  # renovate: datasource=repology depName=alpine_3_22/tesseract-ocr
  TESSERACT_VERSION=5.5.0-r2 \
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
        tesseract-ocr-data-chi_tra=="${TESSERACT_VERSION}" \
        poppler-utils=="${POPPLER_VERSION}"

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
