FROM islandora/scyllaridae:6@sha256:15cd75ac369601c61d22e6b85342cb05bd8361fdcd552dac3825fec0ac8819e8 AS scyllaridae
FROM pandoc/latex:3.9-ubuntu@sha256:ff9e07bec35187b9af90eecb25049b4497ec34d83298fbf2615ea0070c421346 AS pandoc

ARG \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  CURL_VERSION="8.5.0-2ubuntu10.6" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  BASH_VERSION="5.2.21-2ubuntu4" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  GOSU_VERSION="1.17-1ubuntu0.24.04.2" \
  # renovate: datasource=repology depName=ubuntu_24_04/jq
  JQ_VERSION="1.7.1-3ubuntu0.24.04.1"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl="${CURL_VERSION}" \
        bash="${BASH_VERSION}" \
        gosu \
        jq="${JQ_VERSION}" \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=scyllaridae /app/scyllaridae /app/scyllaridae
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
COPY scyllaridae.yml .

ENV \
  SKIP_JWT_VERIFY="" \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml"

RUN groupadd -r nobody && \
    useradd -r -g nobody scyllaridae

ENTRYPOINT ["/bin/bash"]
CMD ["/app/docker-entrypoint.sh"]
