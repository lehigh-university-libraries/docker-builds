FROM islandora/scyllaridae:6@sha256:15cd75ac369601c61d22e6b85342cb05bd8361fdcd552dac3825fec0ac8819e8

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
