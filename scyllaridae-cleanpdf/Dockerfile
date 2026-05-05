FROM islandora/scyllaridae:6@sha256:1f650c1bff8fce4932854408454e9bc5ae76229ce1c467a6d46d0b61540d8e5a

ARG \
  # renovate: datasource=repology depName=alpine_3_22/qpdf
  QPDF_VERSION=12.2.0-r0

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
