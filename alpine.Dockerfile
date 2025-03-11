FROM alpine:latest

STOPSIGNAL SIGTERM

RUN apk update \
 && apk -U upgrade \
 && apk add --no-cache minidlna

EXPOSE 1900 8200

ENTRYPOINT ["minidlnad"]
CMD ["-d"]
