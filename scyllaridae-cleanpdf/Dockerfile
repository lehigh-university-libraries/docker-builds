FROM islandora/scyllaridae:6@sha256:573479dafa271f4071739408753c0ec2e8e59bd97b0f496a721e02a565d1948b

ARG \
  # renovate: datasource=repology depName=alpine_3_22/qpdf
  QPDF_VERSION=12.2.0-r0

RUN apk update && \
    apk add --no-cache \
        qpdf=="${QPDF_VERSION}"

COPY . /app
