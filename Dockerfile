FROM ubuntu:20.04
ARG BAM_READCOUNT_VERSION=0.8.0
ARG BAM_READCOUNT_SHA512=ef2acdc9e9b581cb0e4ccea51e3cb445394733f9812f68790a171b71d5f2f089f73aa39a62a6ddf372baa174b884f7d1e52f3f2c9a2abb716599fd7832501a97
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends\
    build-essential \
    git-core \
    cmake \
    zlib1g-dev \
    libncurses-dev \
    patch \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN wget https://github.com/genome/bam-readcount/archive/refs/tags/v${BAM_READCOUNT_VERSION}.tar.gz && \
    echo "${BAM_READCOUNT_SHA512} v${BAM_READCOUNT_VERSION}.tar.gz" | sha512sum --strict -c - && \
    tar xzf v${BAM_READCOUNT_VERSION}.tar.gz &&\
    rm v${BAM_READCOUNT_VERSION}.tar.gz

RUN mkdir bam-readcount \
    && cd bam-readcount \
    && cmake /bam-readcount-${BAM_READCOUNT_VERSION} \
    && make \
    && rm -rf /bam-readcount-v${BAM_READCOUNT_VERSION} \
    && ln -s /bam-readcount/bin/bam-readcount /usr/local/bin/bam-readcount

WORKDIR /app
CMD ["bash"]
