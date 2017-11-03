FROM alpine:edge

MAINTAINER xiaobinxu <mail@xiaobinxu.com>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
    rm /aria2-webui/.git* -rf && \
    apk del git && \
	apk add --update darkhttpd

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80

CMD ["/conf-copy/start.sh"]
