FROM ubuntu:20.04

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
RUN wget https://github.com/genome/bam-readcount/archive/refs/tags/v1.0.0.tar.gz \
    && tar xzf v1.0.0.tar.gz \
    && rm v1.0.0.tar.gz

RUN mkdir bam-readcount \
    && cd bam-readcount \
    && cmake /bam-readcount-1.0.0 \
    && make \
    && rm -rf /bam-readcount-1.0.0 \
    && ln -s /bam-readcount/bin/bam-readcount /usr/local/bin/bam-readcount

WORKDIR /app
CMD ["bash"]
