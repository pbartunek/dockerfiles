FROM alpine:3.7

RUN apk add --no-cache openssl \
  chromium

RUN adduser -u 1000 -g 1000 -D chromium && \
    mkdir -p /home/chromium/Downloads && \
    mkdir /workdir && \
    chown -R chromium: /home/chromium && \
    chown chromium: /workdir

COPY "scraper.sh" "/"
RUN chmod +x /scraper.sh

USER chromium
WORKDIR /workdir

ENTRYPOINT [ "/scraper.sh" ]
CMD []
