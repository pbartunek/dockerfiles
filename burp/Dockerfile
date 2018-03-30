FROM debian:sid-slim

#RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
RUN apt-get update && apt-get install -y \
  ca-certificates \
  libxrender1 \
  libxtst6 \
  libxi6 \
  wget \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN wget 'https://portswigger.net/burp/releases/download?product=community&type=linux' -O /tmp/burp -nv && sh /tmp/burp -q

ENTRYPOINT [ "/usr/local/BurpSuiteCommunity/BurpSuiteCommunity" ]
