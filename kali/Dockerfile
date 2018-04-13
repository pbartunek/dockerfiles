FROM kalilinux/kali-linux-docker

RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install \
  zsh \
  net-tools \
  screen \
  aptitude \
  proxychains \
  metasploit-framework \
  netcat-traditional \
  tcpdump \
  onesixtyone \
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

CMD ["zsh"]
WORKDIR "/data"
