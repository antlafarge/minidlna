FROM ubuntu:latest

RUN apt update \
	&& apt install -y --no-install-recommends minidlna \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app.sh ./

CMD ["/bin/bash", "-c", "./app.sh"]
