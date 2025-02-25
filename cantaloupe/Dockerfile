FROM islandora/cantaloupe:3.5

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
  && git checkout v14.3.0 \
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
