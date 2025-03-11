FROM alpine:latest

STOPSIGNAL SIGTERM

RUN apk update \
 && apk -U upgrade \
 && apk add --no-cache bash minidlna

RUN mkdir -p "/var/lib/minidlna/Audio"
RUN mkdir -p "/var/lib/minidlna/Pictures"
RUN mkdir -p "/var/lib/minidlna/Videos"

EXPOSE 1900/UDP 

ENTRYPOINT ["minidlnad"]
CMD []
