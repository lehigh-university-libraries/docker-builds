ARG LEHIGH_TAG=main
FROM ghcr.io/lehigh-university-libraries/base:${LEHIGH_TAG}

ARG \
  TARGETARCH=amd64 \
  # renovate: datasource=github-tags depName=golang packageName=golang/go versioning=go-mod-directive
  GO_VERSION=go1.25.3 \
  GO_BASE_URL="https://go.dev/dl/${GO_VERSION}" \
  GO_AMD64=linux-amd64.tar.gz	\
  GO_AMD64_SHA256="0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f" \
  GO_ARM64=linux-arm64.tar.gz \
  GO_ARM64_SHA256="1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5"

RUN --mount=type=cache,id=base-downloads-${TARGETARCH},sharing=locked,target=/opt/downloads \
    if [ "${TARGETARCH}" = "amd64" ]; \
    then \
        download.sh \
            --url "${GO_BASE_URL}.${GO_AMD64}" \
            --sha256 "${GO_AMD64_SHA256}" \
            --dest /usr/local ; \
    else \
        download.sh \
            --url "${GO_BASE_URL}.${GO_ARM64}" \
            --sha256 "${GO_ARM64_SHA256}" \
            --dest /usr/local ; \
    fi

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin

RUN go version | grep "${GO_VERSION}"
