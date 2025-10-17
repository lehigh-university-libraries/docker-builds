FROM islandora/scyllaridae:6@sha256:d8253051949967ac316392853986e69bcba791bf06d24f854716910a4a69de98

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
