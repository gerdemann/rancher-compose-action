FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh

ARG RANCHER_COMPOSE_VERSION=0.12.5

RUN apk add --quiet --no-cache ca-certificates curl unzip
RUN curl -sSL "https://github.com/rancher/rancher-compose/releases/download/v${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-v${RANCHER_COMPOSE_VERSION}.tar.gz" | tar -xzp -C /usr/local/bin/ --strip-components=2
RUN rm -rf /var/cache/*

ENTRYPOINT [ "/entrypoint.sh" ]
