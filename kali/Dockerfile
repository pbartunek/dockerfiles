FROM kalilinux/kali-linux-docker

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
  unzip \
  --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wpscan --update
RUN cd /opt && wget https://github.com/n00py/WPForce/archive/v.1.0.0.tar.gz \
  && tar xzf v.1.0.0.tar.gz \
  && rm v.1.0.0.tar.gz
RUN cd /tmp && wget https://github.com/caffix/amass/releases/download/v1.5.1/amass_1.5.1_linux_amd64.zip \
  && unzip amass_1.5.1_linux_amd64.zip \
  && mv amass /usr/local/bin/ \
  && rm amass_1.5.1_linux_amd64.zip
RUN cd /opt && git clone https://github.com/IOActive/jdwp-shellifier.git
RUN cd /opt && git clone https://github.com/CoreSecurity/impacket.git && cd impacket \
  && pip install .

ENTRYPOINT ["/bin/bash"]
WORKDIR "/data"
