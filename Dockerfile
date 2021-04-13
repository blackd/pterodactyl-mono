# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Mono
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM        mono:latest

LABEL       author="Plamen K. Kosseff" maintainer="p.kosseff@gmail.com"

RUN         adduser -D -h /home/container container \
            

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
