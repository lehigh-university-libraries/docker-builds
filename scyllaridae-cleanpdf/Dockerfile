FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:a9f8d04a3695f0de44fbb0c5c63aac3235bcbf23b6fb6d3f5ecd1f7915aae92f

ARG \
  # renovate: datasource=repology depName=alpine_3_20/qpdf
  QPDF_VERSION="11.9.1-r0"

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
