FROM ubuntu:latest

STOPSIGNAL SIGTERM

RUN apt update \
 && apt install -y --no-install-recommends minidlna \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["minidlnad"]
CMD ["-d"]
