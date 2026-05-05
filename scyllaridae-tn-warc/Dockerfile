FROM islandora/scyllaridae:6@sha256:1f650c1bff8fce4932854408454e9bc5ae76229ce1c467a6d46d0b61540d8e5a

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
