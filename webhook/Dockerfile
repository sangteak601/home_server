FROM ghcr.io/linuxserver-labs/webhook:latest

RUN apk --no-cache --update upgrade && \
    apk --no-cache add python3

RUN mkdir -p /usr/local/bin
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
RUN chmod a+rx /usr/local/bin/yt-dlp  # Make executable
