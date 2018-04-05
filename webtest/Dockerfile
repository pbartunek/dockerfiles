FROM debian:sid-slim

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
  ca-certificates \
  libxrender1 \
  libxtst6 \
  libxi6 \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  ca-certificates \
  firefox-esr \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

COPY files/burpsuite_pro*.sh /tmp/burp
RUN chmod +x /tmp/burp && /tmp/burp -q && rm /tmp/burp
RUN mkdir -p /data/project

COPY files/java /root/.java

EXPOSE 8080

ENTRYPOINT [ "/bin/bash" ]
