FROM islandora/imagemagick:6@sha256:68725952f686e5a8ddf2c838c64fb9268dd954b3964826b4ba5251a57bcd7449 AS imagemagick
FROM islandora/leptonica:6@sha256:65484c3ef232577b82442d3cf2b35ed2eaffb217899df2f17243cc1d3917986a AS leptonica
FROM islandora/drupal:6@sha256:c212723aea572ee54e0ba83ee94474d998e8a9fb4818026f37cee47fbc9e761f

ARG \
    # renovate: datasource=repology depName=alpine_3_22/php83
    PHP_VERSION=8.3.29-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-uploadprogress
    PHP_MEMCACHE_VERSION=8.2-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-uploadprogress
    PHP_UPLOAD_VERSION=2.0.2-r1 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-xhprof
    PHP_XHPROF_VERSION=2.3.10-r0 \
    # renovate: datasource=repology depName=alpine_3_22/ffmpeg
    FFMPEG_VERSION=6.1.2-r2 \
    # renovate: datasource=repology depName=alpine_3_22/poppler-utils
    POPPLER_VERSION=25.04.0-r0 \
    # renovate: datasource=repology depName=alpine_3_22/rsync
    RSYNC_VERSION=3.4.1-r1

RUN --mount=type=bind,from=imagemagick,source=/packages,target=/packages \
    --mount=type=bind,from=imagemagick,source=/etc/apk/keys,target=/etc/apk/keys-imagemagick \
    --mount=type=bind,from=leptonica,source=/packages,target=/packages-leptonica \
    --mount=type=bind,from=leptonica,source=/etc/apk/keys,target=/etc/apk/keys-leptonica \
    cp -r /etc/apk/keys-imagemagick/* /etc/apk/keys-leptonica/* /etc/apk/keys/ && \
    apk update && \
    apk upgrade --available && \
    apk add --no-cache \
      /packages/imagemagick-*.apk /packages-leptonica/leptonica-*.apk \
      php83-pdo_sqlite=="${PHP_VERSION}" \
      php83-pecl-uploadprogress=="${PHP_UPLOAD_VERSION}" \
      php83-pecl-memcache=="${PHP_MEMCACHE_VERSION}" \
      php83-pecl-xhprof=="${PHP_XHPROF_VERSION}" \
      ffmpeg=="${FFMPEG_VERSION}" \
      poppler-utils=="${POPPLER_VERSION}" \
      rsync=="${RSYNC_VERSION}" && \
    cleanup.sh


ARG \
  TARGETARCH \
  # renovate: datasource=github-releases depName=crosswalk packageName=lehigh-university-libraries/crosswalk
  CROSSWALK_VERSION=0.3.2 \
  CROSSWALK_BASE_URL="https://github.com/lehigh-university-libraries/crosswalk/releases/download/v${CROSSWALK_VERSION}" \
  CROSSWALK_AMD64=crosswalk_Linux_x86_64.tar.gz   \
  CROSSWALK_AMD64_SHA256="52784352d5e08b9d91f198d8c73d84722f28e82f40d6fd9011629cb267ee94c5" \
  CROSSWALK_ARM64=crosswalk_Linux_arm64.tar.gz \
  CROSSWALK_ARM64_SHA256="71f3e667882a46deaf05b52a73ffe2d24ced8410f42d805b7709672f0b79e709"

RUN --mount=type=cache,id=crosswalk-downloads-${TARGETARCH},sharing=locked,target=/opt/downloads \
    if [ "${TARGETARCH}" = "amd64" ]; \
    then \
        download.sh \
            --url "${CROSSWALK_BASE_URL}/${CROSSWALK_AMD64}" \
            --sha256 "${CROSSWALK_AMD64_SHA256}" \
            --dest /usr/local/bin ; \
    else \
        download.sh \
            --url "${CROSSWALK_BASE_URL}/${CROSSWALK_ARM64}" \
            --sha256 "${CROSSWALK_ARM64_SHA256}" \
            --dest /usr/local/bin ; \
    fi

