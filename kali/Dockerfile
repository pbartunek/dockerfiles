FROM kalilinux/kali-linux-docker

# tools from kali repo
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install \
  zsh \
  net-tools \
  ssh \
  screen \
  aptitude \
  less \
  proxychains \
  metasploit-framework \
  netcat-traditional \
  socat \
  ncat \
  telnet \
  tftp \
  whois \
  host \
  traceroute \
  smbclient \
  tcpdump \
  masscan \
  nmap \
  amap \
  dirb \
  gobuster \
  wfuzz \
  sqlmap \
  wpscan \
  john \
  hashid \
  build-essential \
  libssl-dev \
  libffi-dev \
  python-dev \
  python-pip \
  python-setuptools \
  ldapscripts \
  unzip \
  vim \
  openjdk-8-jdk \
  python-requests \
  ipcalc \
  --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
# additional tools
RUN  wpscan --update \
  && cd /opt \
  && wget -q https://github.com/n00py/WPForce/archive/v.1.0.0.tar.gz \
  && tar xzf v.1.0.0.tar.gz \
  && rm v.1.0.0.tar.gz \
  && cd /tmp \
  && wget -q https://github.com/caffix/amass/releases/download/v1.5.1/amass_1.5.1_linux_amd64.zip \
  && cd /opt && git clone https://github.com/IOActive/jdwp-shellifier.git \
  && cd /opt && git clone https://github.com/CoreSecurity/impacket.git && cd impacket \
  && pip install . \
  && cd /opt && wget -q https://github.com/matthiaskaiser/jmet/releases/download/0.1.0/jmet-0.1.0-all.jar \
  && wget -q https://jitpack.io/com/github/frohoff/ysoserial/master/ysoserial-master.jar \
  && pip install ldap3 dnspython \
  && pip install ldapdomaindump

# make all directories
RUN mkdir -p /root/.msf4 /root/.ssh

# config files
COPY proxychains.conf /etc/proxychains.conf
COPY screenrc /root/.screenrc
COPY zshrc /root/.zshrc
COPY aliases /root/.aliases
COPY msfconsole.rc /root/.msf4

RUN echo "IPQoS lowdelay" > /root/.ssh/config

ENTRYPOINT ["/usr/bin/zsh", "-c", "screen && exit"]
WORKDIR "/data"
