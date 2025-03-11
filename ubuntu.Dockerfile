FROM ubuntu:latest

STOPSIGNAL SIGTERM

RUN apt update \
 && apt install -y --no-install-recommends minidlna \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p "/var/lib/minidlna/Audio"
RUN mkdir -p "/var/lib/minidlna/Pictures"
RUN mkdir -p "/var/lib/minidlna/Videos"

ENTRYPOINT ["minidlnad"]
CMD []
