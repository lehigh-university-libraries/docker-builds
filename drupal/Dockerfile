FROM islandora/imagemagick:6@sha256:6764d2310e5f8febb62fb91ae52d60cb9595dd329b0bc64c975688f39fdcea33 AS imagemagick
FROM islandora/leptonica:5@sha256:ca7aca3089756820834a76b37fa14a6c62fed669d076dd1f610f8713d8a98657 AS leptonica
FROM islandora/drupal:6@sha256:b0c00ba742df4a5dcfb3fc2ce89f7ebee1ad8c6f1ed91ee30b44d048ca296dd2

ARG \
    # renovate: datasource=repology depName=alpine_3_22/php83
    PHP_VERSION=8.3.26-r0 \
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
    RSYNC_VERSION=3.4.1-r0

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
