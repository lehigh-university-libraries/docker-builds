FROM ubuntu:24.04@sha256:c4570d2f4665d5d118ae29fb494dee4f8db8fcfaee0e37a2e19b827f399070d3

ARG \
  # renovate: datasource=github-releases depName=gha-runner packageName=actions/runner
  RUNNER_VERSION=2.326.0 \
  RUNNER_PLATFORM=linux-x64 \
  RUNNER_SHA=9c74af9b4352bbc99aecc7353b47bcdfcd1b2a0f6d15af54a99f54a0c14a1de8

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    jq \
    make \
    sudo \
    yq \
    libicu-dev \
    docker-buildx \
    docker-compose-v2 \
    docker.io \
    gnupg2 \
    libmagic-dev \
    lsb-release \
    php8.3 \
    php8.3-curl \
    php8.3-fpm \
    php8.3-gd \
    php8.3-intl \
    php8.3-mbstring \
    php8.3-mysql \
    php8.3-opcache \
    php8.3-xml \
    php8.3-zip \
    python3-pip \
    python3-setuptools \
    python3-build \
    python3-urllib3 \
    python3-magic \
    zip \
    unzip

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
ARG COMPOSER_VERSION=2.8.10
ARG COMPOSER_FILE=composer.phar
ARG COMPOSER_URL=https://getcomposer.org/download/${COMPOSER_VERSION}/${COMPOSER_FILE}
ARG COMPOSER_SHA256="28dbb6bd8bef31479c7985b774c130a8bda37dbe63c35b56f6cb6bc377427573"
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
