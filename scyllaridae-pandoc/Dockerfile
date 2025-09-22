FROM ghcr.io/lehigh-university-libraries/scyllaridae:main@sha256:e962c522e49dd48afc11792b89505895ab29a37044ea95591881e299f856c27e AS scyllaridae
FROM pandoc/latex:3.7-ubuntu@sha256:b035cf4b287f0582d73e31e881e4a8816a8ca902812da93ed86f72579f0cda79 AS pandoc

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
COPY --from=scyllaridae /app/docker-entrypoint.sh /app/docker-entrypoint.sh
COPY scyllaridae.yml .

ENV \
  SKIP_JWT_VERIFY="" \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml"

RUN groupadd -r nobody && \
    useradd -r -g nobody scyllaridae

ENTRYPOINT ["/bin/bash"]
CMD ["/app/docker-entrypoint.sh"]
