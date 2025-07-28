FROM ghcr.io/lehigh-university-libraries/scyllaridae-imagemagick:main@sha256:a9af6f56878cbc1c283cce1d54a6c2f9cb471dfcfa99425c54593fc9a12e042a


RUN apk update && \
  apk add --no-cache \
    chromium \
    chromium-chromedriver \
    python3 \
    py3-pip	\
    gnupg \
    unzip \
    xvfb

RUN pip install --no-cache-dir  --break-system-packages \
    warcio \
    selenium

ENV \
  DISPLAY=:99 \
  PYTHONUNBUFFERED=1

COPY scyllaridae.yml /app/scyllaridae.yml
COPY warc_screenshot.py /app/warc_screenshot.py
