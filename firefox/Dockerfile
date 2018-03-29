FROM debian:sid-slim

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \
	ca-certificates \
	firefox \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG en-US

# Add user
RUN groupadd --gid 2001 -r browser && useradd -m --uid 2001 -r --gid 2001 -G audio,video browser \
    && mkdir -p /home/browser/Downloads && chown -R browser:browser /home/browser

USER browser

ENTRYPOINT [ "/usr/bin/firefox" ]
