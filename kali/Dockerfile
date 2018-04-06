FROM kalilinux/kali-linux-docker

RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install \
  zsh \
  metasploit-framework \
  nmap \
  tcpdump \
  john \
  dirb \
  proxychains \
  masscan \
  gobuster \
  wfuzz \
  net-tools \
  screen \
  aptitude \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

CMD ["zsh"]
WORKDIR "/root"
