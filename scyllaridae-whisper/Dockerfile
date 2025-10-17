FROM islandora/scyllaridae:6@sha256:d8253051949967ac316392853986e69bcba791bf06d24f854716910a4a69de98 AS scyllaridae
FROM ghcr.io/ggerganov/whisper.cpp:main-cuda@sha256:2eb507108c363c29399f564929e293509c01c98ba516173ab5b769ce6aafdabb

ARG \
  # renovate: datasource=repology depName=ubuntu_22_04/gosu
  GOSU_VERSION="1.14-1ubuntu0.1"

COPY --from=scyllaridae /app /app
COPY scyllaridae.yml /app
COPY cmd.sh /app

RUN bash ./models/download-ggml-model.sh medium.en

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    gosu="${GOSU_VERSION}" \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -r nobody \
  && useradd -r -g nobody scyllaridae \
  && chmod +x /app/docker-entrypoint.sh /app/cmd.sh \
  && chown scyllaridae /app/models


ENV \
  SKIP_JWT_VERIFY="" \
  SCYLLARIDAE_YML_PATH="/app/scyllaridae.yml" \
  WHISPER_PROCESSORS=1 \
  WHISPER_THREADS=4

ENTRYPOINT ["/app/docker-entrypoint.sh"]
