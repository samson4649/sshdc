FROM alpine:edge

LABEL maintainer=samuel.lock@monarch-ares.com


RUN apk add --update --no-cache openssh sudo bash curl wget lftp openssl git mysql-client && \
        rm -rf /tmp/* /var/cache/apk/*

RUN addgroup elite && \
        echo '%elite ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD ./docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]

