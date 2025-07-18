FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:e962c522e49dd48afc11792b89505895ab29a37044ea95591881e299f856c27e

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
