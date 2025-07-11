FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:a9f8d04a3695f0de44fbb0c5c63aac3235bcbf23b6fb6d3f5ecd1f7915aae92f

ARG \
  # renovate: datasource=repology depName=alpine_3_20/openjdk17-jre
  OPENJDK_VERSION="17.0.15_p6-r0" \
  # renovate: datasource=repology depName=alpine_3_20/libreoffice
  LIBREOFFICE_VERSION="7.6.7.2-r0" \
  # renovate: datasource=repology depName=alpine_3_20/font-dejavu
  TTF_DEJAVU_VERSION="2.37-r5"

RUN apk update && \
  apk add --no-cache \
    openjdk17-jre=="${OPENJDK_VERSION}" \
    libreoffice=="${LIBREOFFICE_VERSION}" \
    ttf-dejavu=="${TTF_DEJAVU_VERSION}"

COPY scyllaridae.yml /app/
COPY cmd.sh /app/
