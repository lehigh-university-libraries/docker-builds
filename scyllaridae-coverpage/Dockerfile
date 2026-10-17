FROM islandora/scyllaridae:6@sha256:0b9ec5d134d8da39a1a8326ee781faa5450022b2b1d9ad43f68530009d835984 AS scyllaridae
FROM pandoc/latex:3.10-ubuntu@sha256:568ae5d3dc4cf9266753c9c78e7d073c1472f6540e0cf02de6a330143df8bdb7 AS pandoc

ARG \
  # renovate: datasource=repology depName=ubuntu_24_04/curl
  CURL_VERSION="8.5.0-2ubuntu10.9" \
  # renovate: datasource=repology depName=ubuntu_24_04/bash
  BASH_VERSION="5.2.21-2ubuntu4" \
  # renovate: datasource=repology depName=ubuntu_24_04/ghostscript
  GHOSTSCRIPT_VERSION="10.02.1~dfsg1-0ubuntu7.6" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  GOSU_VERSION="1.17-1ubuntu0.24.04.2" \
  # renovate: datasource=repology depName=ubuntu_24_04/jq
  JQ_VERSION="1.7.1-3ubuntu0.24.04.2"

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
COPY . /app

ENV \
  SKIP_JWT_VERIFY="" \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml"

RUN groupadd -r nobody && \
    useradd -r -g nobody scyllaridae

ENTRYPOINT ["/bin/bash"]
CMD ["/app/docker-entrypoint.sh"]
