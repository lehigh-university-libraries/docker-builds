ARG LORIS_VERSION=3.2.1
FROM ubuntu:focal

ENV TZ=Etc/UTC
ENV PROXY_URL=https://loris.iiif.example.com
ENV CORS_REGEX=''

WORKDIR /opt
RUN ln -snf /usr/share/zoneinfo/"$TZ" "/etc/localtime" && \
    echo "$TZ" > /etc/timezone && \
    apt-get -y upgrade && \
    apt-get update && \
    apt-get -y install python3-pip=20.0.2-5ubuntu1.9 \
                   wget=1.20.3-1ubuntu2 \
                   libjpeg-turbo8-dev=2.0.3-0ubuntu1.20.04.3 \
                   libfreetype6-dev=2.10.1-2ubuntu0.3 \
                   zlib1g-dev=1:1.2.11.dfsg-2ubuntu1.5 \
                   liblcms2-dev=2.9-4 \
                   liblcms2-utils=2.9-4 \
                   libtiff5-dev=4.1.0+git191117-2ubuntu0.20.04.8 \
                   libwebp-dev=0.6.1-2ubuntu0.20.04.2 \
                   libopenjp2-tools=2.3.1-1ubuntu4.20.04.1 \
                   python3-dev=3.8.2-0ubuntu2 \
                   libssl-dev=1.1.1f-1ubuntu2.19 \
                   gcc=4:9.3.0-1ubuntu2 \
                   --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --no-cache-dir \
         Pillow==9.5.0 \
         configobj==5.0.8 \
         requests==2.31.0 \
         mock==5.0.2 \
         responses==0.23.1 && \
    adduser loris && \
    wget --quiet https://github.com/loris-imageserver/loris/archive/refs/tags/v"$LORIS_VERSION".tar.gz && \
    tar -zxvf v"$LORIS_VERSION".tar.gz && \
    ln -s loris-"$LORIS_VERSION" loris

WORKDIR /opt/loris
RUN python3 setup.py install && \
    python3 bin/setup_directories.py && \
    mkdir -p /opt/loris/cache/info && \
    chown -R loris.loris /opt/loris/cache && \
    chmod -R 700 /opt/loris/cache

COPY conf/loris.conf /opt/loris/etc/loris.conf
COPY webapp.py /opt/loris/loris/webapp.py

ENTRYPOINT ["python3"]

CMD ["/opt/loris/loris/webapp.py"]
