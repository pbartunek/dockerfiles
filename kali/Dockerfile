FROM kalilinux/kali-linux-docker

RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install zsh metasploit-framework nmap tcpdump \
  john dirb proxychains masscan gobuster net-tools wfuzz \
  aptitude

CMD ["zsh"]
