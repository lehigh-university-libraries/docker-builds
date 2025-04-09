FROM islandora/cantaloupe:3.6@sha256:89bd0bc1a4e7ad72311c4b63f5858c5cfca4219da362b19faf20723b60bc0c71

ARG \
    # renovate: datasource=repology depName=alpine_3_20/gcc
    GCC_VERSION=13.2.1_git20240309-r1 \
    # renovate: datasource=repology depName=alpine_3_20/g++
    GPP_VERSION=13.2.1_git20240309-r1 \
    # renovate: datasource=repology depName=alpine_3_20/cmake
    CMAKE_VERSION=3.29.3-r0 \
    # renovate: datasource=repology depName=alpine_3_20/make
    MAKE_VERSION=4.4.1-r2 \
    # renovate: datasource=repology depName=alpine_3_20/exiftool
    EXIFTOOL_VERSION=12.80-r0 \
    # renovate: datasource=repology depName=alpine_3_20/lcms2-dev
    LCMS2_VERSION=2.16-r0 \
    # renovate: datasource=repology depName=alpine_3_20/libjpeg-turbo
    LIBJPEG_TURBO_VERSION=3.0.3-r0 \
    # renovate: datasource=repology depName=alpine_3_20/libpng-dev
    LIBPNG_VERSION=1.6.44-r0 \
    # renovate: datasource=repology depName=alpine_3_20/zstd-dev
    ZSTD_VERSION=1.5.6-r0 \
    # renovate: datasource=repology depName=alpine_3_20/tiff-dev
    TIFF_VERSION=4.6.0t-r0 \
    # renovate: datasource=repology depName=alpine_3_20/jpeg-dev
    JPEG_VERSION=9e-r1 \
    # renovate: datasource=repology depName=alpine_3_20/zlib-dev
    ZLIB_VERSION=1.3.1-r1 \
    # renovate: datasource=repology depName=alpine_3_20/libwebp-dev
    LIBWEBP_VERSION=1.3.2-r0

RUN apk add --no-cache \
    gcc=="${GCC_VERSION}" \
    g++=="${GPP_VERSION}" \
    cmake=="${CMAKE_VERSION}" \
    make=="${MAKE_VERSION}" \
    exiftool=="${EXIFTOOL_VERSION}" \
    lcms2-dev=="${LCMS2_VERSION}" \
    libjpeg-turbo=="${LIBJPEG_TURBO_VERSION}" \
    libpng-dev=="${LIBPNG_VERSION}" \
    zstd-dev=="${ZSTD_VERSION}" \
    tiff-dev=="${TIFF_VERSION}" \
    jpeg-dev=="${JPEG_VERSION}" \
    zlib-dev=="${ZLIB_VERSION}" \
    libwebp-dev=="${LIBWEBP_VERSION}"

RUN git clone https://github.com/CLIUtils/CLI11.git /tmp/CLI11 \
    && mkdir /tmp/CLI11/build \
    && cd /tmp/CLI11/build \
    && cmake .. \
    && make \
    && make install \
    && rm -rf /tmp/CLI11

RUN git clone https://github.com/GrokImageCompression/grok.git /tmp/grok \
    && cd /tmp/grok \
    && git checkout v14.3.0 \
    && cmake . \
    && make install \
    && rm -rf /tmp/grok

RUN apk del \
    gcc \
    g++ \
    cmake \
    make \
    exiftool \
    lcms2-dev \
    libjpeg-turbo \
    libpng-dev \
    zstd-dev \
    tiff-dev \
    jpeg-dev \
    zlib-dev \
    libwebp-dev
