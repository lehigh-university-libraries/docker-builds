FROM islandora/cantaloupe:3.2.1

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
  && git checkout v12.0.0 \
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
