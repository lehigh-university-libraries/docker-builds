FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:e962c522e49dd48afc11792b89505895ab29a37044ea95591881e299f856c27e

ARG \
  # renovate: datasource=repology depName=alpine_3_20/qpdf
  QPDF_VERSION="11.9.1-r0"

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
