FROM debian:sid-slim

#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
RUN apt-get update && apt-get install -y \
  wget \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate 'https://portswigger.net/burp/releases/download?product=community&type=linux' -O /tmp/

ENTRYPOINT [ "/bin/bash" ]
