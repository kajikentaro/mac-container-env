#!/bin/bash
set -e

mkdir -p /run/sshd

# Generate ssh key for the first time
if [ ! -f /etc/ssh/ssh_host_ed25519_key ]; then
    ssh-keygen -A
fi

USER=aaa

# Generate password every time the container starts
PASS="$(openssl rand -base64 24)"

# Change password to the generated one
echo "${USER}:${PASS}" | chpasswd

echo "==== SSH login info ===="
echo "user: ${USER}"
echo "password: ${PASS}"
echo

echo "container hostname:"
hostname
echo

echo "container IP addresses:"
hostname -I 2>/dev/null || echo "  IP address unavailable"
echo "========================"

# -D: Start in the foreground
# -e: Log to stderr
exec /usr/sbin/sshd -D -e
