FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:a9f8d04a3695f0de44fbb0c5c63aac3235bcbf23b6fb6d3f5ecd1f7915aae92f AS scyllaridae
FROM pandoc/latex:3.7-ubuntu@sha256:0641e4142b609a732d1b2d4ffd71e716152c25a902d9dd3ede33e90d7b2c880c AS pandoc

ARG \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  CURL_VERSION="8.5.0-2ubuntu10.6" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  BASH_VERSION="5.2.21-2ubuntu4" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  GOSU_VERSION="1.17-1ubuntu0.24.04.2" \
  # renovate: datasource=repology depName=ubuntu_24_04/jq
  JQ_VERSION="1.7.1-3build1"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl="${CURL_VERSION}" \
        bash="${BASH_VERSION}" \
        gosu \
        jq="${JQ_VERSION}" \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=scyllaridae /app/scyllaridae /app/scyllaridae
COPY --from=scyllaridae /app/docker-entrypoint.sh /app/docker-entrypoint.sh
COPY scyllaridae.yml .

ENV \
  SKIP_JWT_VERIFY="" \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml"

RUN groupadd -r nobody && \
    useradd -r -g nobody scyllaridae

ENTRYPOINT ["/bin/bash"]
CMD ["/app/docker-entrypoint.sh"]
