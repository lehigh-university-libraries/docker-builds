FROM ubuntu:24.04@sha256:b59d21599a2b151e23eea5f6602f4af4d7d31c4e236d22bf0b62b86d2e386b8f

ARG \
  # renovate: datasource=github-releases depName=gha-runner packageName=actions/runner
  RUNNER_VERSION=2.325.0 \
  RUNNER_PLATFORM=linux-x64 \
  RUNNER_SHA=5020da7139d85c776059f351e0de8fdec753affc9c558e892472d43ebeb518f4

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG \
    # renovate: datasource=repology depName=ubuntu_24_04/ca-certificates
    CA_CERTIFICATES_VERSION=20240203 \
    # renovate: datasource=repology depName=ubuntu_24_04/curl
    CURL_VERSION=8.5.0-2ubuntu10.6 \
    # renovate: datasource=repology depName=ubuntu_24_04/git
    GIT_VERSION=1:2.43.0-1ubuntu7.2 \
    # renovate: datasource=repology depName=ubuntu_24_04/jq
    JQ_VERSION=1.7.1-3build1 \
    # renovate: datasource=repology depName=ubuntu_24_04/make
    MAKE_VERSION=4.3-4.1build2 \
    # renovate: datasource=repology depName=ubuntu_24_04/sudo
    SUDO_VERSION=1.9.15p5-3ubuntu5 \
    # renovate: datasource=repology depName=ubuntu_24_04/yq
    YQ_VERSION=3.1.0-3 \
    # renovate: datasource=repology depName=ubuntu_24_04/docker-buildx
    DOCKER_BUILDX_VERSION=0.20.1-0ubuntu1~24.04.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/docker-compose-v2
    DOCKER_COMPOSE_VERSION=2.33.0+ds1-0ubuntu1~24.04.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/docker.io
    DOCKER_VERSION=26.1.3-0ubuntu1~24.04.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/gnupg2
    GNUPG_VERSION=2.4.4-2ubuntu17.2 \
    # renovate: datasource=repology depName=ubuntu_24_04/lsb-release-minimal
    LSB_VERSION=12.0-2 \
    # renovate: datasource=repology depName=ubuntu_24_04/php8.3
    PHP_VERSION=8.3.6-0ubuntu0.24.04.4 \
    # renovate: datasource=repology depName=ubuntu_24_04/unzip
    ZIP_VERSION=3.0-13ubuntu0.2 \
    # renovate: datasource=repology depName=ubuntu_24_04/unzip
    UNZIP_VERSION=6.0-28ubuntu4.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/libmagic-dev
    LIBMAGIC_VERSION=1:5.45-3build1 \
    # renovate: datasource=repology depName=ubuntu_24_04/python3-pip
    PYTHON_PIP_VERSION=24.0+dfsg-1ubuntu1.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/python3-setuptools
    PYTHON_SETUPTOOLS_VERSION=68.1.2-2ubuntu1.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/python3-build
    PYTHON_BUILD_VERSION=1.0.3-2 \
    # renovate: datasource=repology depName=ubuntu_24_04/python3-urllib3
    PYTHON_URLLIB3_VERSION=2.0.7-1ubuntu0.1 \
    # renovate: datasource=repology depName=ubuntu_24_04/python3-magic
    PYTHON_MAGIC_VERSION=2:0.4.27-3

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
    ca-certificates=${CA_CERTIFICATES_VERSION} \
    curl=${CURL_VERSION} \
    git=${GIT_VERSION} \
    jq=${JQ_VERSION} \
    make=${MAKE_VERSION} \
    sudo=${SUDO_VERSION} \
    yq=${YQ_VERSION} \
    libicu-dev \
    docker-buildx=${DOCKER_BUILDX_VERSION} \
    docker-compose-v2=${DOCKER_COMPOSE_VERSION} \
    docker.io=${DOCKER_VERSION} \
    gnupg2=${GNUPG_VERSION} \
    libmagic-dev="${LIBMAGIC_VERSION}" \
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
    php8.3-zip="${PHP_VERSION}" \
    python3-pip="${PYTHON_PIP_VERSION}" \
    python3-setuptools="${PYTHON_SETUPTOOLS_VERSION}" \
    python3-build="${PYTHON_BUILD_VERSION}" \
    python3-urllib3="${PYTHON_URLLIB3_VERSION}" \
    python3-magic="${PYTHON_MAGIC_VERSION}" \
    zip="${ZIP_VERSION}" \
    unzip="${UNZIP_VERSION}"

# install kubectl
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl && \
    kubectl version --client

# install GitHub actions runner
RUN curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${RUNNER_PLATFORM}-${RUNNER_VERSION}.tar.gz && \
  echo "$RUNNER_SHA  actions-runner.tar.gz" | sha256sum -c && \
  tar xzf ./actions-runner.tar.gz && \
  rm ./actions-runner.tar.gz && \
  bash ./bin/installdependencies.sh && \
  useradd -m -s /bin/bash runner && \
  echo "runner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/runner && \
  usermod -aG docker runner && \
  rm -rf /var/lib/apt/lists/*

# install composer
# renovate: datasource=github-releases depName=custom-composer packageName=composer/composer
ARG COMPOSER_VERSION=2.8.9
ARG COMPOSER_FILE=composer.phar
ARG COMPOSER_URL=https://getcomposer.org/download/${COMPOSER_VERSION}/${COMPOSER_FILE}
ARG COMPOSER_SHA256="8e8829ec2b97fcb05158236984bc252bef902e7b8ff65555a1eeda4ec13fb82b"
RUN curl -sLo "${COMPOSER_FILE}" "${COMPOSER_URL}" && \
    echo "${COMPOSER_SHA256}  ${COMPOSER_FILE}" | sha256sum -c && \
    mv "${COMPOSER_FILE}" /usr/bin/composer && \
    chmod a+x /usr/bin/composer

# install islandora workbench python dependencies
WORKDIR /workbench
RUN curl -o workbench.zip -L https://github.com/lehigh-university-libraries/islandora_workbench/archive/refs/heads/simple-field-json.zip && \
  echo "bb2725b42330f319df09d955b149023f08c00b88d623d8e50a817c6b5f493811  workbench.zip" | sha256sum -c && \
  unzip -oj ./workbench.zip && \
  rm ./workbench.zip && \
  python3 -m build --no-isolation && \
  python3 -m pip install --no-build-isolation --break-system-packages dist/*.whl && \
  rm -rf /workbench

RUN mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && curl -L -o $out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y

WORKDIR /app

COPY docker-entrypoint.sh .
COPY isle.pem /etc/ssl/certs/isle.pem

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
