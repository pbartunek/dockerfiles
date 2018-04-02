# Chrome in a container
#
# based on:
# https://github.com/jessfraz/dockerfiles/tree/master/chrome/stable
#
# seccomp profile:
# wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O chrome.json
#
FROM debian:sid-slim

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        hicolor-icon-theme \
        libcanberra-gtk* \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        libpango1.0-0 \
        libpulse0 \
        libv4l-0 \
        fonts-symbola \
        --no-install-recommends \
        && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
        && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
        && apt-get update && apt-get install -y \
        google-chrome-stable \
        --no-install-recommends \
        && apt-get purge --auto-remove -y curl \
        && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 -r chrome && useradd -r -g chrome --uid 1000 -G audio,video chrome \
    && mkdir -p /home/chrome/Downloads && chown -R chrome:chrome /home/chrome

USER chrome

ENTRYPOINT [ "google-chrome" ]
