FROM islandora/scyllaridae:6@sha256:4a45cf205eb89eb3fb420aed8f7d9066b28c5f5cfd8931505c673c4d45e15d23

ARG \
  # renovate: datasource=repology depName=alpine_3_22/qpdf
  QPDF_VERSION=12.2.0-r0

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
