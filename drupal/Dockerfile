FROM islandora/imagemagick:alpine-3.20.2-imagemagick-7.1.1.36-r0@sha256:a1fa03a18e7e232e380d070d196dc2c0e0a8762dd385640b932e28fcacfd9b05 as imagemagick
FROM islandora/leptonica:alpine-3.20.2-leptonica-1.84.1-r0@sha256:9e9e46a328d8b55a61a352a6b06ff175f98e40cd5773c9bf93aac58fb56b65f7 as leptonica
FROM islandora/drupal:4@sha256:47bff97b55216814462ec4a002da079cd7584cee62446d9a69fb2bd6e01c3279

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
    FFMPEG_VERSION=6.1.1-r8

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
      ffmpeg=="${FFMPEG_VERSION}" && \
    cleanup.sh
