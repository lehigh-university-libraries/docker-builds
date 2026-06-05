FROM islandora/scyllaridae:6.4.2@sha256:573479dafa271f4071739408753c0ec2e8e59bd97b0f496a721e02a565d1948b AS scyllaridae
FROM ghcr.io/ggml-org/whisper.cpp:main-cuda@sha256:1d1d9a899ee7af679db74483a802245b09d37058c1e02ce438e7124e795268ba

ARG \
  # renovate: datasource=repology depName=ubuntu_22_04/gosu
  GOSU_VERSION="1.14-1ubuntu0.1"

RUN bash ./models/download-ggml-model.sh medium.en

WORKDIR /app

COPY --from=scyllaridae /app/scyllaridae .
COPY scyllaridae.yml .
COPY cmd.sh .
COPY docker-entrypoint.sh .

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    gosu="${GOSU_VERSION}" \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -r nobody \
  && useradd -r -g nobody scyllaridae \
  && chmod +x /app/docker-entrypoint.sh /app/cmd.sh \
  && chown scyllaridae /app/models


ENV \
  SCYLLARIDAE_ALLOW_INSECURE_ARGS="false" \
  SCYLLARIDAE_LOG_LEVEL=INFO \
  SCYLLARIDAE_PORT=8080 \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml" \
  WHISPER_PROCESSORS=1 \
  WHISPER_THREADS=4

ENTRYPOINT ["/app/docker-entrypoint.sh"]

