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
  nmap \
  tcpdump \
  john \
  dirb \
  masscan \
  gobuster \
  wfuzz \
  sqlmap \
  hashid \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

CMD ["zsh"]
WORKDIR "/data"
