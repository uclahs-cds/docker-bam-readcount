FROM ubuntu:20.04
ARG bam_readcount_VERSION=1.0.0
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
RUN wget https://github.com/genome/bam-readcount/archive/refs/tags/v${bam_readcount_VERSION}.tar.gz \
    && tar xzf v${bam_readcount_VERSION}.tar.gz \
    && rm v${bam_readcount_VERSION}.tar.gz

RUN mkdir bam-readcount \
    && cd bam-readcount \
    && cmake /bam-readcount-${bam_readcount_VERSION} \
    && make \
    && rm -rf /bam-readcount-v${bam_readcount_VERSION} \
    && ln -s /bam-readcount/bin/bam-readcount /usr/local/bin/bam-readcount

WORKDIR /app
CMD ["bash"]
