FROM ubuntu:20.04
ARG BAM_READCOUNT_VERSION=1.0.1
ARG BAM_READCOUNT_SHA512=f9b1561774a4280d3d14cd069b13a5ccce40b0ae1a1be1859a36ae268f9a7ecb5b281f4fbbc93a3216ed2a16043b82bf3aa1e418b11c73a6af465048ca524232
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
