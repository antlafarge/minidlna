FROM ubuntu:latest

STOPSIGNAL SIGTERM

RUN apt update \
	&& apt install -y --no-install-recommends minidlna \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app.sh ./

RUN chmod 777 app.sh

CMD ["/bin/bash", "-c", "./app.sh"]
