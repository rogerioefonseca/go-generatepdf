ARG GO_VERSION=latest
ARG GOPATH=/opt

FROM golang:${GO_VERSION}

RUN mkdir -p /opt/projetos ; \
    echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile

SHELL ["/bin/bash", "-c"]
RUN source /etc/profile

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["go","version"]