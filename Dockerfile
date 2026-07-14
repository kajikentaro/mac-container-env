FROM debian:bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       openssh-server \
       sudo \
       openssl \
       ca-certificates \
    && mkdir -p /run/sshd \
    && useradd -m -s /bin/bash aaa \
    && echo "aaa ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/aaa \
    && chmod 0440 /etc/sudoers.d/aaa \
    && sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
