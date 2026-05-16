FROM islandora/scyllaridae:6@sha256:33ba03afccd02fc50557aa2b969876f6c5411f97cee3e77752091e761483d3cb

ARG \
  # renovate: datasource=repology depName=alpine_3_22/openjdk17-jre
  OPENJDK_VERSION=17.0.18_p8-r0 \
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
