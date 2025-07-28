FROM ghcr.io/lehigh-university-libraries/scyllaridae-imagemagick:main@sha256:a9af6f56878cbc1c283cce1d54a6c2f9cb471dfcfa99425c54593fc9a12e042a

RUN apk update && \
  apk add --no-cache \
    zip \
    ttf-liberation

# need more modern tree command for --from-file support
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main tree

COPY scyllaridae.yml /app/scyllaridae.yml
COPY cmd.sh /app/cmd.sh
