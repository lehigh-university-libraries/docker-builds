FROM islandora/scyllaridae:6.4.1@sha256:33ba03afccd02fc50557aa2b969876f6c5411f97cee3e77752091e761483d3cb AS scyllaridae
FROM ghcr.io/ggml-org/whisper.cpp:main-cuda@sha256:8da90d1a92e8ea0e23b0e65da79a21fa3466a77e043b862408b9b8db7c8906a5

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

