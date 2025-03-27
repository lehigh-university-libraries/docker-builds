FROM ubuntu:24.04@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

ENV RUNNER_PLATFORM=linux-x64 \
  RUNNER_VERSION=2.323.0 \
  RUNNER_SHA=0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG \
    # renovate: datasource=repology depName=ubuntu_24_04/ca-certificates
    CA_CERTIFICATES_VERSION=20240203 \
    # renovate: datasource=repology depName=ubuntu_24_04/curl
    CURL_VERSION=8.5.0-2ubuntu10.6 \
    # renovate: datasource=repology depName=ubuntu_24_04/jq
    JQ_VERSION=1.7.1-3build1 \
    # renovate: datasource=repology depName=ubuntu_24_04/sudo
    SUDO_VERSION=1.9.15p5-3ubuntu5 \
    # renovate: datasource=repology depName=ubuntu_24_04/yq
    YQ_VERSION=3.1.0-3 \
    # renovate: datasource=repology depName=ubuntu_24_04/docker-buildx
    DOCKER_BUILDX_VERSION=0.14.1-0ubuntu1~24.04.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/docker-compose-v2
    DOCKER_COMPOSE_VERSION=2.27.1+ds1-0ubuntu1~24.04.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/docker.io
    DOCKER_VERSION=26.1.3-0ubuntu1~24.04.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/gnupg2
    GNUPG_VERSION=2.4.4-2ubuntu17 \
    # renovate: datasource=repology depName=ubuntu_24_04/lsb-release-minimal
    LSB_VERSION=12.0-2 \
    # renovate: datasource=repology depName=ubuntu_24_04/php8.3
    PHP_VERSION=8.3.6-0ubuntu0.24.04.3

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
    ca-certificates=${CA_CERTIFICATES_VERSION} \
    curl=${CURL_VERSION} \
    jq=${JQ_VERSION} \
    sudo=${SUDO_VERSION} \
    yq=${YQ_VERSION} \
    libicu-dev \
    docker-buildx=${DOCKER_BUILDX_VERSION} \
    docker-compose-v2=${DOCKER_COMPOSE_VERSION} \
    docker.io=${DOCKER_VERSION} \
    gnupg2=${GNUPG_VERSION} \
    lsb-release=${LSB_VERSION} \
    php8.3=${PHP_VERSION} \
    php8.3-curl="${PHP_VERSION}" \
    php8.3-fpm="${PHP_VERSION}" \
    php8.3-gd="${PHP_VERSION}" \
    php8.3-intl="${PHP_VERSION}" \
    php8.3-mbstring="${PHP_VERSION}" \
    php8.3-mysql="${PHP_VERSION}" \
    php8.3-opcache="${PHP_VERSION}" \
    php8.3-xml="${PHP_VERSION}" \
    php8.3-zip="${PHP_VERSION}"

RUN curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${RUNNER_PLATFORM}-${RUNNER_VERSION}.tar.gz && \
  echo "$RUNNER_SHA  actions-runner.tar.gz" | sha256sum -c && \
  tar xzf ./actions-runner.tar.gz && \
  rm ./actions-runner.tar.gz && \
  bash ./bin/installdependencies.sh && \
  useradd -m -s /bin/bash runner && \
  echo "runner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/runner && \
  usermod -aG docker runner && \
  rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh .

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
