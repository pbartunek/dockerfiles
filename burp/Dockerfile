FROM debian:sid-slim

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
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
RUN mkdir -p /data

COPY user.json /data/user.json
COPY project.json /data/project.json

RUN groupadd -g 1000 -r burp && useradd -r -g burp --uid 1000 -G audio,video burp \
    && mkdir -p /home/burp/Downloads && chown -R burp:burp /home/burp

USER burp

EXPOSE 8080

ENTRYPOINT [ "/usr/local/BurpSuiteCommunity/BurpSuiteCommunity" ]
CMD [ "--user-config-file=/data/user.json", "--config-file=/data/project.json" ]
