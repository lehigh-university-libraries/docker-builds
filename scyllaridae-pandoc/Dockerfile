FROM islandora/scyllaridae:6@sha256:1f650c1bff8fce4932854408454e9bc5ae76229ce1c467a6d46d0b61540d8e5a AS scyllaridae
FROM pandoc/latex:3.9-ubuntu@sha256:601777bf5e7b9642ce7acdd46eef1daa69b4efdc47a539254d8fc0942d6a7cfd AS pandoc

ARG \
  # renovate: datasource=repology depName=ubuntu_24_04/curl
  CURL_VERSION="8.5.0-2ubuntu10.9" \
  # renovate: datasource=repology depName=ubuntu_24_04/bash
  BASH_VERSION="5.2.21-2ubuntu4" \
  # renovate: datasource=repology depName=ubuntu_24_04/gosu
  GOSU_VERSION="1.17-1ubuntu0.24.04.2" \
  # renovate: datasource=repology depName=ubuntu_24_04/jq
  JQ_VERSION="1.7.1-3ubuntu0.24.04.2"

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
