ARG LEHIGH_TAG=main
FROM ghcr.io/lehigh-university-libraries/base:${LEHIGH_TAG}

WORKDIR /app

ARG \
    # renovate: datasource=repology depName=debian_13/python3-pip
    PIP_VERSION=25.1.1+dfsg-1 \
    # renovate: datasource=repology depName=debian_13/python3
    PYTHON_VERSION=3.13.5-1

RUN apt-get update && apt-get install -y \
        python3-pip=${PIP_VERSION} \
        python3=${PYTHON_VERSION} \
    && cleanup.sh

RUN create-service-user.sh --name pyapp && \
    cleanup.sh

ENV PIP_BREAK_SYSTEM_PACKAGES=1 \
    FLASK_APP="application.app:app" \
    WORKERS=4 \
    SCRIPT_NAME=

RUN pip install uv && uv --version

COPY --link rootfs /

HEALTHCHECK CMD curl -f http://localhost:8080${SCRIPT_NAME}healthcheck
