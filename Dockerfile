FROM mcr.microsoft.com/devcontainers/base:bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       openssh-server \
       sudo \
       openssl \
       ca-certificates \
       systemd \
       systemd-sysv \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]

