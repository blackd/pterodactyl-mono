# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Mono
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        alpine:edge

LABEL       author="Plamen K. Kosseff" maintainer="p.kosseff@gmail.com"

RUN         echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
            apk add --update --no-cache openssl curl sqlite libgdiplus mono && \
            apk add --no-cache --virtual=.build-dependencies ca-certificates && \
            cert-sync /etc/ssl/certs/ca-certificates.crt && \
            apk del .build-dependencies && \
            adduser -D -h /home/container container

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
