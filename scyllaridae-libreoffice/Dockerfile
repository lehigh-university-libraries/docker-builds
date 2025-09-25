FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:17b3ea02586a752473d42920b9098b9e8e395fde37b498d41e904e29c4e51353

ARG \
  # renovate: datasource=repology depName=alpine_3_22/openjdk17-jre
  OPENJDK_VERSION=17.0.16_p8-r0 \
  # renovate: datasource=repology depName=alpine_3_22/libreoffice
  LIBREOFFICE_VERSION=25.2.5.2-r0 \
  # renovate: datasource=repology depName=alpine_3_22/font-dejavu
  TTF_DEJAVU_VERSION=2.37-r6

RUN apk update && \
  apk add --no-cache \
    openjdk17-jre=="${OPENJDK_VERSION}" \
    libreoffice=="${LIBREOFFICE_VERSION}" \
    ttf-dejavu=="${TTF_DEJAVU_VERSION}"

COPY scyllaridae.yml /app/
COPY cmd.sh /app/
