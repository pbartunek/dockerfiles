FROM debian:sid-slim

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y \
  ca-certificates \
  libxrender1 \
  libxtst6 \
  libxi6 \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libpulse0 \
  ca-certificates \
  chromium \
  ssh \
  net-tools \
  libnss3-tools \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# copy start script
COPY start.sh /data/start.sh
RUN chmod +x /data/start.sh

# install burp
COPY files/burpsuite_pro*.sh /tmp/burp
RUN chmod +x /tmp/burp && /tmp/burp -q && rm /tmp/burp

# switch to non uid 0 user
RUN sed -i 's/root/toor/' /etc/passwd
RUN groupadd -g 1000 -r webtest && \
  useradd -d /home/webtest -m -r -g webtest -u 1000 -G audio,video root
USER root

# import burp ca certificate
COPY files/cacert.der /data/cacert.der
RUN mkdir -p $HOME/.pki/nssdb && \
  certutil -d $HOME/.pki/nssdb -N --empty-password && \
  certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n burp -i /data/cacert.der

RUN mkdir -p $HOME/.java $HOME/.BurpSuite $HOME/.config/chromium

EXPOSE 8080


ENTRYPOINT [ "/bin/bash" ]
WORKDIR "/data/"
