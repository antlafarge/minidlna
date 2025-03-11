FROM alpine:latest

LABEL dockerhub="https://hub.docker.com/r/antlafarge/minidlna" \
      github="https://github.com/antlafarge/minidlna" \
      maintainer.name="Antoine Lafarge" \
      maintainer.email="ant.lafarge@gmail.com" \
      maintainer.github="https://github.com/antlafarge" \
      maintainer.dockerhub="https://hub.docker.com/u/antlafarge"

STOPSIGNAL SIGTERM

RUN apk update \
 && apk -U upgrade \
 && apk add --no-cache minidlna

EXPOSE 1900 8200

ENTRYPOINT ["minidlnad"]
CMD ["-d"]
