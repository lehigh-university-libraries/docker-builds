FROM islandora/imagemagick:4@sha256:534884b74f11e3931d0a7fe682dcc4ae76ca56a5d9c79bbb7757e2fbeff132ea AS imagemagick
FROM islandora/leptonica:4@sha256:c804dd4f8960c9dbf7020155b46086914ce0bfc2b1db7e697bf165d9954913dd AS leptonica
FROM islandora/drupal:4@sha256:9aa681f14fe0412320cb2059f0fb958c3da339314a5328136636a8f5e626e268

ARG \
    # renovate: datasource=repology depName=alpine_3_20/php83-pdo_sqlite
    PHP_VERSION=8.3.15-r0 \
    # renovate: datasource=repology depName=alpine_3_20/php83-pecl-uploadprogress
    PHP_MEMCACHE_VERSION=8.2-r0 \
    # renovate: datasource=repology depName=alpine_3_20/php83-pecl-uploadprogress
    PHP_UPLOAD_VERSION=2.0.2-r1 \
    # renovate: datasource=repology depName=alpine_3_20/php83-pecl-xhprof
    PHP_XHPROF_VERSION=2.3.9-r2 \
    # renovate: datasource=repology depName=alpine_3_20/ffmpeg
    FFMPEG_VERSION=6.1.1-r8 \
    # renovate: datasource=repology depName=alpine_3_20/poppler-utils
    POPPLER_VERSION=24.02.0-r2 \
    # renovate: datasource=repology depName=alpine_3_20/rsync
    RSYNC_VERSION=3.4.0-r0

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
