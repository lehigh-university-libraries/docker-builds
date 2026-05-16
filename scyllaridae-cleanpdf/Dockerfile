FROM islandora/scyllaridae:6@sha256:33ba03afccd02fc50557aa2b969876f6c5411f97cee3e77752091e761483d3cb

ARG \
  # renovate: datasource=repology depName=alpine_3_22/qpdf
  QPDF_VERSION=12.2.0-r0

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
