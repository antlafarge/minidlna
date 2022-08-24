FROM alpine:latest

STOPSIGNAL SIGTERM

RUN apk -U upgrade \
	&& apk add --no-cache bash minidlna

WORKDIR /app

COPY app.sh ./

RUN chmod 777 app.sh

CMD ["/bin/bash", "-c", "./app.sh"]
