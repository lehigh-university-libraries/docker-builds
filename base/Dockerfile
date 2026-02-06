FROM debian:trixie-slim@sha256:f6e2cfac5cf956ea044b4bd75e6397b4372ad88fe00908045e9a0d21712ae3ba

LABEL License="MIT License"

ARG SOURCE_DATE_EPOCH

ENV \
    # reproducible builds
    SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH:-0} \
    DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    TZ=UTC \
    # s6-overlay/confd defaults
    CERTIFICATE_AUTHORITY=/usr/local/share/ca-certificates/rootCA.pem \
    CERTIFICATE=/usr/local/share/ca-certificates/cert.pem \
    CONFD_BACKEND=env \
    CONFD_ENABLE_SERVICE=false \
    CONFD_LOG_LEVEL=error \
    CONFD_POLLING_INTERVAL=30 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_CMD_WAIT_FOR_SERVICE=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=30000 \
    S6_LOGGING=0 \
    S6_SERVICES_GRACETIME=30000 \
    TERM=xterm \
    DB_DRIVER=mysql \
    DB_HOST= \
    DB_MYSQL_HOST=mariadb \
    DB_MYSQL_PORT=3306 \
    DB_NAME=default \
    DB_PASSWORD=password \
    DB_PORT= \
    DB_POSTGRESQL_HOST=postgresql \
    DB_POSTGRESQL_PORT=5432 \
    DB_ROOT_PASSWORD=password \
    DB_ROOT_USER=root \
    DB_USER=default \
    DEVELOPMENT_ENVIRONMENT=false \
    UID= \
    DOWNLOAD_CACHE_DIRECTORY=/opt/downloads

ARG \
  TARGETARCH=amd64 \
  # renovate: datasource=repology depName=debian_13/bash
  BASH_VERSION=5.2.37-2+b7 \
  # renovate: datasource=repology depName=debian_13/ca-certificates
  CA_CERTIFICATES_VERSION=20250419 \
  # renovate: datasource=repology depName=debian_13/curl
  CURL_VERSION=8.14.1-2+deb13u2 \
  # renovate: datasource=repology depName=debian_13/gnupg2
  GNUPG_VERSION=2.4.7-21+deb13u1 \
  # renovate: datasource=repology depName=debian_13/gzip
  GZIP_VERSION=1.13-1 \
  # renovate: datasource=repology depName=debian_13/jq
  JQ_VERSION=1.7.1-6+deb13u1 \
  # renovate: datasource=repology depName=debian_13/netcat-openbsd	
  NETCAT_OPENBSD_VERSION=1.229-1 \
  # renovate: datasource=repology depName=debian_13/openssl
  OPENSSL_VERSION=3.5.4-1~deb13u2 \
  # renovate: datasource=repology depName=debian_13/patch
  PATCH_VERSION=2.8-2 \
  # renovate: datasource=repology depName=debian_13/procps-ng
  PROCPS_VERSION=2:4.0.4-9 \
  # renovate: datasource=repology depName=debian_13/util-linux
  UTIL_LINUX_VERSION=2.41-5 \
  # renovate: datasource=repology depName=debian_13/wget
  WGET_VERSION=1.25.0-2 \
  # renovate: datasource=repology depName=debian_13/wget
  XZ_UTILS_VERSION=5.8.1-1

RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get install -y \
        bash=${BASH_VERSION} \
        ca-certificates=${CA_CERTIFICATES_VERSION} \
        curl=${CURL_VERSION} \
        gnupg2=${GNUPG_VERSION} \
        gzip=${GZIP_VERSION} \
        jq=${JQ_VERSION} \
        netcat-openbsd=${NETCAT_OPENBSD_VERSION} \
        openssl=${OPENSSL_VERSION} \
        patch=${PATCH_VERSION} \
        procps=${PROCPS_VERSION} \
        util-linux=${UTIL_LINUX_VERSION} \
        wget=${WGET_VERSION} \
        xz-utils=${XZ_UTILS_VERSION}

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

# renovate: datasource=github-releases depName=s6-overlay packageName=just-containers/s6-overlay
ARG S6_VERSION=3.2.2.0
ARG S6_BASE_URL="https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}"
ARG S6_OVERLAY_NOARCH=s6-overlay-noarch.tar.xz
ARG S6_OVERLAY_NOARCH_SHA256="85848f6baab49fb7832a5557644c73c066899ed458dd1601035cf18e7c759f26"
ARG S6_OVERLAY_SYMLINKS_ARCH=s6-overlay-symlinks-arch.tar.xz
ARG S6_OVERLAY_SYMLINKS_ARCH_SHA256="9364479e3f9f4d42425312ced93e25ca2a8896d0405ac747d815ca56338321f0"
ARG S6_OVERLAY_SYMLINKS_NOARCH=s6-overlay-symlinks-noarch.tar.xz
ARG S6_OVERLAY_SYMLINKS_NOARCH_SHA256="fae2b2fd6da3067a5f484e915dc5744e2b152abc81721a72f3d2e9b2d6657204"
ARG S6_OVERLAY_AMD64=s6-overlay-x86_64.tar.xz
ARG S6_OVERLAY_AMD64_SHA256="5a09e2f1878dc5f7f0211dd7bafed3eee1afe4f813e872fff2ab1957f266c7c0"
ARG S6_OVERLAY_ARM64=s6-overlay-aarch64.tar.xz
ARG S6_OVERLAY_ARM64_SHA256="50a5d4919e688fafc95ce9cf0055a46f74847517bcf08174bac811de234ec7d2"

# Install s6.
RUN --mount=type=bind,source=rootfs/usr/local/bin/download.sh,target=/usr/local/bin/download.sh \
    download.sh \
        --url "${S6_BASE_URL}/${S6_OVERLAY_NOARCH}" \
        --sha256 "${S6_OVERLAY_NOARCH_SHA256}" \
        --dest / \
    && \
    download.sh \
        --url "${S6_BASE_URL}/${S6_OVERLAY_SYMLINKS_ARCH}" \
        --sha256 "${S6_OVERLAY_SYMLINKS_ARCH_SHA256}" \
        --dest / \
    && \
    download.sh \
        --url "${S6_BASE_URL}/${S6_OVERLAY_SYMLINKS_NOARCH}" \
        --sha256 "${S6_OVERLAY_SYMLINKS_NOARCH_SHA256}" \
        --dest / \
    && \
    echo '' > /root/.ash_history

RUN --mount=type=bind,source=rootfs/usr/local/bin/download.sh,target=/usr/local/bin/download.sh \
    --mount=type=cache,id=base-downloads-${TARGETARCH},sharing=locked,target=/opt/downloads \
    if [ "${TARGETARCH}" = "amd64" ]; \
    then \
        download.sh \
            --url "${S6_BASE_URL}/${S6_OVERLAY_AMD64}" \
            --sha256 "${S6_OVERLAY_AMD64_SHA256}" \
            --dest / ; \
    else \
        download.sh \
            --url "${S6_BASE_URL}/${S6_OVERLAY_ARM64}" \
            --sha256 "${S6_OVERLAY_ARM64_SHA256}" \
            --dest / ; \
    fi

COPY --link rootfs /

# Install confd
COPY --link confd/confd-0.15.0-linux-${TARGETARCH} /usr/local/bin/confd

# Start s6
ENTRYPOINT [ "/init" ]
