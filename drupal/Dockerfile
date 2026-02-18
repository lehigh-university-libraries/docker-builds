FROM islandora/drupal:6@sha256:c212723aea572ee54e0ba83ee94474d998e8a9fb4818026f37cee47fbc9e761f

ARG \
    # renovate: datasource=repology depName=alpine_3_22/php83
    PHP_VERSION=8.3.29-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-memcache
    PHP_MEMCACHE_VERSION=8.2-r0 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-uploadprogress
    PHP_UPLOAD_VERSION=2.0.2-r1 \
    # renovate: datasource=repology depName=alpine_3_22/php83-pecl-xhprof
    PHP_XHPROF_VERSION=2.3.10-r0 \
    # renovate: datasource=repology depName=alpine_3_22/rsync
    RSYNC_VERSION=3.4.1-r1

RUN apk update && \
    apk add --no-cache \
      php83-pdo_sqlite=="${PHP_VERSION}" \
      php83-pecl-uploadprogress=="${PHP_UPLOAD_VERSION}" \
      php83-pecl-memcache=="${PHP_MEMCACHE_VERSION}" \
      php83-pecl-xhprof=="${PHP_XHPROF_VERSION}" \
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

