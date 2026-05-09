FROM islandora/drupal:6.4.0@sha256:3d475f9f3bb1128a7399dc95e9c403cb0e53bb677e54d5c086ae315a8090a656

ARG \
    # renovate: datasource=repology depName=alpine_3_22/ffmpeg
    FFMPEG_VERSION=6.1.2-r2 \
    # renovate: datasource=repology depName=alpine_3_22/imagemagick
    IMAGEMAGICK_VERSION=7.1.2.15-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83
    PHP_VERSION=8.3.29-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-memcache
    PHP_MEMCACHE_VERSION=8.2-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-uploadprogress
    PHP_UPLOAD_VERSION=2.0.2-r1 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-xhprof
    PHP_XHPROF_VERSION=2.3.10-r0 \
    # renovate: datasource=repology depName=alpine_3_22/vips
    VIPS_VERSION=8.16.1-r0

RUN apk update && \
    apk add --no-cache \
      ffmpeg=="${FFMPEG_VERSION}" \
      imagemagick=="${IMAGEMAGICK_VERSION}" \
      php83-pdo_sqlite=="${PHP_VERSION}" \
      php83-pecl-uploadprogress=="${PHP_UPLOAD_VERSION}" \
      php83-pecl-memcache=="${PHP_MEMCACHE_VERSION}" \
      php83-pecl-xhprof=="${PHP_XHPROF_VERSION}" \
      vips=="${VIPS_VERSION}" \
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

