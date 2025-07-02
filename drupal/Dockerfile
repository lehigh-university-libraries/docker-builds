FROM islandora/imagemagick:4@sha256:318acde66b8c12aa9eaa2047b17c228fc8c1366fa0be462f41764d9a0024b32f AS imagemagick
FROM islandora/leptonica:4@sha256:e22b06d1816481e42ef472a0464b7047978167cfd146e9f800cdfc25d783e76d AS leptonica
FROM islandora/drupal:4@sha256:43156f650aa7d81e7763d1d5eaee383e801564add2ae40794996e1ddcf598ca5

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
