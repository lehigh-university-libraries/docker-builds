FROM islandora/scyllaridae:6@sha256:33ba03afccd02fc50557aa2b969876f6c5411f97cee3e77752091e761483d3cb

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
