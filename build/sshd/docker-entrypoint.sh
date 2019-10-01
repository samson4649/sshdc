#!/bin/sh

if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
        # generate fresh rsa key
        ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
        # generate fresh dsa key
        ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

# configure user account to use
id ${DOCKER_SSH_USER:-docker-ssh-user} >/dev/null || adduser -Ss /bin/sh ${DOCKER_SSH_USER:-docker-ssh-user} || exit 1
echo ${DOCKER_SSH_USER}:${DOCKER_SSH_PASS:-supersecurepassword} | chpasswd || exit 3
#adduser -Ss /bin/sh ${DOCKER_SSH_USER}
adduser ${DOCKER_SSH_USER} elite

exec "$@"

