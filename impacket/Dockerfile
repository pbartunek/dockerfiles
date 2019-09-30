FROM python:2.7-alpine
RUN apk --update --no-cache add \
    zlib-dev \
    musl-dev \
    libc-dev \
    libffi-dev \
    gcc \
    git \
    openssl-dev && \
    rm -rf /var/cache/apk/*
RUN mkdir -p /opt/impacket \
  && cd /opt && git clone https://github.com/CoreSecurity/impacket.git \
  && cd impacket \
  && pip install /opt/impacket

WORKDIR /opt/impacket/examples
CMD ["python"]
