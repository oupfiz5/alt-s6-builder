# syntax=docker/dockerfile:1.4

# * Arguments
ARG \
      BUILD_DATE="${BUILD_DATE}" \
      FOSSIL_VERSION="${FOSSIL_VERSION}" \
      BASE_IMAGE_NAME="${BASE_IMAGE_NAME}" \
      BASE_IMAGE_REPOSITORY="${UBUNTU_IMAGE_REPOSITORY}" \
      BASE_IMAGE_TAG="${UBUNTU_IMAGE_TAG}" \
      NS_VERSION="${NS_VERSION}" \
      NS_MODULES_VERSION="${NS_MODULES_VERSION}" \
      RL_JSON_VERSION="${RL_JSON_VERSION}" \
      TCL_VERSION="${TCL_VERSION}" \
      TCLLIB_VERSION="${TCLLIB_VERSION}" \
      THREAD_VERSION="${THREAD_VERSION}" \
      XOTCL_VERSION="${XOTCL_VERSION}" \
      TDOM_VERSION="${TDOM_VERSION}"

  FROM ${BASE_IMAGE_REPOSITORY}/${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}

  # ** Environments
  ENV \
      FOSSIL_VERSION=${FOSSIL_VERSION} \
      NS_VERSION=${NS_VERSION} \
      NS_MODULES_VERSION=${NS_MODULES_VERSION} \
      RL_JSON_VERSION=${RL_JSON_VERSION} \
      TCL_VERSION=${TCL_VERSION} \
      TCLLIB_VERSION=${TCLLIB_VERSION} \
      THREAD_VERSION=${THREAD_VERSION} \
      XOTCL_VERSION=${XOTCL_VERSION} \
      TDOM_VERSION=${TDOM_VERSION}

  # * Labels
  LABEL \
      maintainer="Oupfiz V <oupfiz5@yandex.ru>" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.authors="Oupfiz V (Five)" \ org.opencontainers.image.url="https://chiselapp.com/user/oupfiz5/repository/alt-s6-builder/home" \ org.opencontainers.image.documentation="https://chiselapp.com/user/oupfiz5/repository/alt-s6-builder/wiki" \ org.opencontainers.image.source="https://chiselapp.com/user/oupfiz5/repository/alt-s6-builder/brlist" \
      org.opencontainers.image.version="0.0.2d" \
      org.opencontainers.image.revision="" \
      org.opencontainers.image.vendor="" \
      org.opencontainers.image.licenses="" \
      org.opencontainers.image.ref.name="" \
      org.opencontainers.image.title="AltLinux image for build tcl packages" \
      org.opencontainers.image.description="AltLinux image for build tcl packages" \
      org.opencontainers.alt-s6-builder.version="${VERSION}"

  # * Environment

  # * Copy scripts
  COPY builds /builds
  COPY VERSIONS /VERSIONS

  # * Add
  ADD https://www.fossil-scm.org/home/uv/fossil-linux-x64-2.19.tar.gz /tmp/fossil-linux.tar.gz

  # * Run
  # hadolint ignore=DL3008,DL3003,DL3015
  RUN mkdir /var/lib/apt/lists/partial && \
      apt-get update && \
      apt-get install -y \
              apache2 \
              autoconf_2.60 \
              automake_1.16 \
              bison \
              boost-devel \
              cpp \
              curl \
              gcc \
              gcc-c++ \
              gdb \
              git \
              glibc-i18ndata \
              gnupg2 \
              libbsd-devel \
              libcurl-devel \
              libgd3-devel \
              libgeos-devel \
              libmemcached-devel \
              libminizip-devel \
              libpq5-devel \
              libproj-devel \
              libreadline-devel \
              libsqlite3-devel \
              libssl-devel \
              libtool \
              libuv-devel \
              libxml2-devel \
              libxslt-devel \
              libyajl-devel \
              lsb-release \
              make \
              openssl \
              pkg-config \
              postgresql14 \
              python3-module-pip \
              python3-module-virtualenv \
              swig \
              tzdata \
              wget \
              zlib-devel \
      && pip3 install --no-cache-dir "cmake==3.24.1.1" \
      && localedef -c -i en_US -f UTF-8 en_US.UTF-8 \
      && echo LANG="en_US.UTF-8" >> /etc/sysconfig/i18n \
      && echo LC_ALL="en_US.UTF-8" >> /etc/sysconfig/i18n \
      && cd /tmp \
      && tar xzf /tmp/fossil-linux.tar.gz -C /usr/bin \
      && rm /tmp/fossil-linux.tar.gz \
      && rm -r /usr/share/man/* \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists  \
            /var/cache/apt/archives/*.rpm  \
            /var/cache/apt/*.bin

  # * Entrypoint
  ENTRYPOINT ["/init"]
