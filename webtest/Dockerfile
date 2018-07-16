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
  chromium \
  libnss3-tools \
  --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# copy start script
COPY start.sh /data/start.sh
RUN chmod +x /data/start.sh

# install burp
COPY files/burpsuite_pro*.sh /tmp/burp
RUN chmod +x /tmp/burp && /tmp/burp -q && rm /tmp/burp

# switch to non uid 0 user
RUN sed -i 's/root/toor/' /etc/passwd && groupadd -g 1000 -r webtest && \
  useradd -d /home/webtest -m -r -g webtest -u 1000 -G audio,video root

# copy burp project config
COPY project.json /data/project.json

USER root

# import burp ca certificate
COPY files/cacert.der /data/cacert.der
RUN mkdir -p $HOME/.pki/nssdb && \
  certutil -d $HOME/.pki/nssdb -N --empty-password && \
  certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n burp -i /data/cacert.der

# create directories for mount points
RUN mkdir -p $HOME/.java $HOME/.BurpSuite $HOME/.config/chromium $HOME/Downloads

WORKDIR "/data/"
ENTRYPOINT [ "/data/start.sh" ]

EXPOSE 8080
