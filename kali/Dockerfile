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
  john \
  hashid \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
WORKDIR "/data"
