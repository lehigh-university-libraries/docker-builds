FROM islandora/scyllaridae:6@sha256:1f650c1bff8fce4932854408454e9bc5ae76229ce1c467a6d46d0b61540d8e5a

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
