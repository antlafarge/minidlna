MINIDLNA
========

# Docker

```yml
services:
    minidlna:
        image: antlafarge/minidlna:latest
        container_name: minidlna
        restart: on-failure:3
        volumes:
            - /storage/Shared/Audio/:/var/lib/minidlna/Audio/:ro
            - /storage/Shared/Pictures/:/var/lib/minidlna/Pictures/:ro
            - /storage/Shared/Videos/:/var/lib/minidlna/Videos/:ro
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
    -v /storage/Shared/Audio/:/var/lib/minidlna/Audio/:ro \
    -v /storage/Shared/Pictures/:/var/lib/minidlna/Pictures/:ro \
    -v /storage/Shared/Videos/:/var/lib/minidlna/Videos/:ro \
    -p 445:445/tcp \
    -p 137:137/udp \
    --name minidlna \
    antlafarge/minidlna:latest

# Override entrypoint arguments (enable log debug level 10)
docker run -d \
    -v /storage/Shared/Audio/:/var/lib/minidlna/Audio/:ro \
    -v /storage/Shared/Pictures/:/var/lib/minidlna/Pictures/:ro \
    -v /storage/Shared/Videos/:/var/lib/minidlna/Videos/:ro \
    -p 445:445/tcp \
    -p 137:137/udp \
    --name minidlna \
    antlafarge/minidlna:dev-alpine --foreground --no-process-group --debug-stdout --debuglevel=10

# Override entrypoint (sh)
docker run --rm -it \
    -v /storage/Shared/Audio/:/var/lib/minidlna/Audio/:ro \
    -v /storage/Shared/Pictures/:/var/lib/minidlna/Pictures/:ro \
    -v /storage/Shared/Videos/:/var/lib/minidlna/Videos/:ro \
    -p 445:445/tcp \
    -p 137:137/udp \
    --name minidlna \
     --entrypoint sh \
    antlafarge/minidlna:dev-alpine
```

# Build

```bash
cd minidlna
docker build -t minidlna:dev-alpine -f alpine.Dockerfile .
```
