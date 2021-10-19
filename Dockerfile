FROM blcdsdockerregistry/bl-base:1.0.0 AS builder

# Use conda to install tools and dependencies into /usr/local
ARG bam-readcount_VERSION=0.8
RUN conda create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    bam-readcount==${bam-readcount_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Mao Tian <maotian@mednet.ucla.edu>"