FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:17b3ea02586a752473d42920b9098b9e8e395fde37b498d41e904e29c4e51353 AS scyllaridae
FROM pandoc/latex:3.7-ubuntu@sha256:b035cf4b287f0582d73e31e881e4a8816a8ca902812da93ed86f72579f0cda79 AS pandoc

ARG \
  # renovate: datasource=repology depName=ubuntu_24_04/curl
  CURL_VERSION="8.5.0-2ubuntu10.6" \
  # renovate: datasource=repology depName=ubuntu_24_04/bash
  BASH_VERSION="5.2.21-2ubuntu4" \
  # renovate: datasource=repology depName=ubuntu_24_04/ghostscript
  GHOSTSCRIPT_VERSION="10.02.1~dfsg1-0ubuntu7.6" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  GOSU_VERSION="1.17-1ubuntu0.24.04.2" \
  # renovate: datasource=repology depName=ubuntu_24_04/jq
  JQ_VERSION="1.7.1-3ubuntu0.24.04.1"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl="${CURL_VERSION}" \
        bash="${BASH_VERSION}" \
        ghostscript \
        gosu \
        jq="${JQ_VERSION}" \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=scyllaridae /app/scyllaridae /app/scyllaridae
COPY --from=scyllaridae /app/docker-entrypoint.sh /app/docker-entrypoint.sh
COPY . /app

ENV \
  SKIP_JWT_VERIFY="" \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml"

RUN groupadd -r nobody && \
    useradd -r -g nobody scyllaridae

ENTRYPOINT ["/bin/bash"]
CMD ["/app/docker-entrypoint.sh"]
