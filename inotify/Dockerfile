FROM lscr.io/linuxserver/baseimage-alpine:3.21

RUN apk --no-cache --update upgrade && \
    apk --no-cache add inotify-tools docker-cli

COPY ./monitor.sh /monitor.sh
RUN chmod +x /monitor.sh

ENTRYPOINT ["/monitor.sh"]