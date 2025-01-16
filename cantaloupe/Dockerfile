FROM islandora/cantaloupe:3.4

ENV CANTALOUPE_ENDPOINT_API_ENABLED="true" \
    CANTALOUPE_ENDPOINT_API_USERNAME=islandora

RUN apk add --no-cache \
    gcc \
    g++ \
    cmake \
    make \
    exiftool \
    libjpeg-turbo \
    lcms2-dev \
    libpng-dev \
    zstd-dev \
    tiff-dev \
    jpeg-dev \
    zlib-dev \
    libwebp-dev \
  && git clone https://github.com/CLIUtils/CLI11.git \
  && cd CLI11 \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && cd ../.. && rm -rf grok \
  && git clone https://github.com/GrokImageCompression/grok \
  && cd grok \
  && git checkout v14.2.0 \
  && cmake . \
  && make install \
  && cd ../ && rm -rf grok \
  && apk del \
    gcc \
    g++ \
    cmake \
    make \
    exiftool \
    lcms2-dev \
    libpng-dev \
    zstd-dev \
    tiff-dev \
    jpeg-dev \
    zlib-dev \
    libwebp-dev

COPY --link rootfs /

HEALTHCHECK CMD curl -s \
  -u "${CANTALOUPE_ENDPOINT_API_USERNAME}:$(cat /var/run/s6/container_environment/CANTALOUPE_ENDPOINT_API_SECRET)" \
  http://localhost:8182/health | jq .color | grep -q GREEN
