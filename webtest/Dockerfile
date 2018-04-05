FROM debian:sid-slim

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
  ca-certificates \
  libxrender1 \
  libxtst6 \
  libxi6 \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  ca-certificates \
  chromium \
  vim \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

COPY files/burpsuite_pro*.sh /tmp/burp
RUN chmod +x /tmp/burp && /tmp/burp -q && rm /tmp/burp
RUN mkdir -p /data/project

COPY files/java /root/.java
COPY project.json /data/project.json
COPY start.sh /data/start.sh
RUN chmod +x /data/start.sh

EXPOSE 8080

ENTRYPOINT [ "/bin/bash" ]
WORKDIR "/data/"
