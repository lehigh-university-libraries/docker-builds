FROM islandora/cantaloupe:3.4

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
  && git clone https://github.com/GrokImageCompression/grok \
  && cd grok \
  && git checkout v14.2.0 \
  && cmake . \
  && make install \
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

HEALTHCHECK CMD curl -s http://localhost:8182/health | jq .color | grep -q GREEN
