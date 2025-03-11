FROM ubuntu:latest

LABEL dockerhub="https://hub.docker.com/r/antlafarge/samba" \
      github="https://github.com/antlafarge/samba" \
      maintainer.name="Antoine Lafarge" \
      maintainer.email="ant.lafarge@gmail.com" \
      maintainer.github="https://github.com/antlafarge" \
      maintainer.dockerhub="https://hub.docker.com/u/antlafarge"

ENV TZ='Europe/Paris'
ENV LANG='C.UTF-8'
ENV LC_ALL='C.UTF-8'

RUN apt update \
 && apt install -y --no-install-recommends minidlna \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 445 137 138 139 1512

ENTRYPOINT ["minidlnad"]
CMD ["-d"]
