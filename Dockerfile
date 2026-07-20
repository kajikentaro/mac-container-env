FROM mcr.microsoft.com/devcontainers/base:bookworm

# Required softwares
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       openssh-server \
       sudo \
       openssl \
       ca-certificates \
       systemd \
       systemd-sysv

# Optional softwares
RUN apt-get install -y --no-install-recommends \
    tmux \
    xclip \
    net-tools \
    netcat-openbsd \
    vim \
    curl \
    dnsutils

# Docker (https://docs.docker.com/engine/install/debian/)
# Please run this later. `sudo groupadd docker && sudo usermod -aG docker $USER`
RUN apt install ca-certificates curl \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
    && chmod a+r /etc/apt/keyrings/docker.asc \
    && tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
RUN apt update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

ENTRYPOINT ["/bin/bash"]

