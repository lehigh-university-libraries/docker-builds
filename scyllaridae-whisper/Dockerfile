FROM islandora/scyllaridae:6.4.0@sha256:fb43a9f2cd0627eed20059e1438a0b07e3a5808a5e5527e2e7249802e564e3df AS scyllaridae
FROM ghcr.io/ggml-org/whisper.cpp:main-cuda@sha256:4a63de6d770163700e32bd300158bee5eac523ee5ab5ab165efe4b44ed8e6a5e

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

