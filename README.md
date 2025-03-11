MINIDLNA
========

`/opt/` is scanned and shared by minidlna.

# Docker

```yml
services:
    minidlna:
        image: antlafarge/minidlna:latest
        container_name: minidlna
        restart: on-failure:3
        volumes:
            - /storage/Shared/Audio/:/opt/Audio/:ro
            - /storage/Shared/Pictures/:/opt/Pictures/:ro
            - /storage/Shared/Videos/:/opt/Videos/:ro
        networks:
            - minidlna
        ports:
            - 1900:1900/udp
            - 8200:8200/tcp
        environment:
            TZ: Europe/Paris

networks:
    minidlna:
        driver: bridge
```

```bash
# Normal
docker run -d \
    -v /storage/Shared/Audio/:/opt/Audio/:ro \
    -v /storage/Shared/Pictures/:/opt/Pictures/:ro \
    -v /storage/Shared/Videos/:/opt/Videos/:ro \
    -p 1900:1900/tcp \
    -p 8200:8200/udp \
    --name minidlna \
    antlafarge/minidlna:latest

# Override entrypoint (sh)
docker run --rm -it \
    -v /storage/Shared/Audio/:/opt/Audio/:ro \
    -v /storage/Shared/Pictures/:/opt/Pictures/:ro \
    -v /storage/Shared/Videos/:/opt/Videos/:ro \
    -p 1900:1900/tcp \
    -p 8200:8200/udp \
    --name minidlna \
     --entrypoint sh \
    antlafarge/minidlna:dev-alpine
```

# Build

```bash
cd minidlna
docker build -t minidlna:dev-alpine -f alpine.Dockerfile .
```
