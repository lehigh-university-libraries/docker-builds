FROM islandora/scyllaridae:6@sha256:7ce43871a331d60fcbd89201f86c4d27d3f8ad8de7d37dcb3d70a103e063cb73

ARG \
  # renovate: datasource=repology depName=alpine_3_22/qpdf
  QPDF_VERSION=12.2.0-r0

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
