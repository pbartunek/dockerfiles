FROM debian:sid-slim

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
  --no-install-recommends \
  ca-certificates \
  bzip2 \
  libfontconfig1 \
  wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN wget -q \
  https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && tar -xf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin \
  && rm -rf phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs-2.1.1-linux-x86_64 \
  && apt-get remove --autoremove -y wget bzip2
RUN groupadd -g 1000 -r scraper \
  && useradd -d /home/scraper -m -r -g scraper -u 1000 scraper \
  && mkdir -p /data/workdir

COPY "scraper-phantom.js" "/data/"
COPY "scraper.sh" "/data/"

RUN chmod +x /data/scraper.sh \
  && chown scraper: -R /data
USER scraper

WORKDIR "/data/workdir"
ENTRYPOINT [ "/data/scraper.sh" ]
CMD []
