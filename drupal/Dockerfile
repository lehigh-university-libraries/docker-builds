FROM islandora/drupal:alpine-3-24@sha256:d5fadb80284e8f59b11e8d8e5f6a3ea363b879838e86447817fb6702316b2e64

ARG \
    # renovate: datasource=repology depName=alpine_3_24/ffmpeg
    FFMPEG_VERSION=8.1.2-r0 \
    # renovate: datasource=repology depName=alpine_3_24/imagemagick
    IMAGEMAGICK_VERSION=7.1.2.27-r0 \
    # renovate: datasource=repology depName=alpine_3_24/php84
    PHP_VERSION=8.4.24-r0 \
    # renovate: datasource=repology depName=alpine_3_24/php84-pecl-memcache
    PHP_MEMCACHE_VERSION=8.2-r1 \
    # renovate: datasource=repology depName=alpine_3_24/php84-pecl-uploadprogress
    PHP_UPLOAD_VERSION=2.0.2-r2 \
    # renovate: datasource=repology depName=alpine_3_24/php84-pecl-xhprof
    PHP_XHPROF_VERSION=2.3.10-r1 \
    # renovate: datasource=repology depName=alpine_3_24/vips
    VIPS_VERSION=8.18.2-r0

RUN apk update && \
    apk add --no-cache \
      ffmpeg=="${FFMPEG_VERSION}" \
      imagemagick=="${IMAGEMAGICK_VERSION}" \
      php84-pdo_sqlite=="${PHP_VERSION}" \
      php84-pecl-uploadprogress=="${PHP_UPLOAD_VERSION}" \
      php84-pecl-memcache=="${PHP_MEMCACHE_VERSION}" \
      php84-pecl-xhprof=="${PHP_XHPROF_VERSION}" \
      vips=="${VIPS_VERSION}" && \
    cleanup.sh

ARG \
  TARGETARCH \
  # renovate: datasource=github-releases depName=crosswalk packageName=lehigh-university-libraries/crosswalk
  CROSSWALK_VERSION=0.3.9 \
  CROSSWALK_BASE_URL="https://github.com/lehigh-university-libraries/crosswalk/releases/download/v${CROSSWALK_VERSION}" \
  CROSSWALK_AMD64=crosswalk_Linux_x86_64.tar.gz   \
  CROSSWALK_AMD64_SHA256="77b29f8f34c030d6b52194b7d9dcb41b087810a984be43f8c9615316658ef2fe" \
  CROSSWALK_ARM64=crosswalk_Linux_arm64.tar.gz \
  CROSSWALK_ARM64_SHA256="b4ed72b250ce1f774d54f39171b783b8745b4eb2b313ea221da75f5aa7967ab5"

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

