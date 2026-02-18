FROM islandora/scyllaridae:6@sha256:15cd75ac369601c61d22e6b85342cb05bd8361fdcd552dac3825fec0ac8819e8

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
