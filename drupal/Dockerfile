FROM islandora/imagemagick:4@sha256:1cca252e44addbba4155fc08c169ac76cf432e4d3707d6da515b096fc2b00916 AS imagemagick
FROM islandora/leptonica:4@sha256:f699749ac5bb6295a87faaa04c7ba8d94a330b1bb6dcd84db4e61bd328434cb3 AS leptonica
FROM islandora/drupal:4@sha256:1134d6648fc84a1a642b0a0123ddb5e6c5eaa63b71a22260c9fdd0db05fe37ca

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
