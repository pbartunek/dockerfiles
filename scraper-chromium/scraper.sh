#!/bin/sh

for site in $@; do
  cd /workdir
  /usr/bin/chromium-browser --headless --disable-gpu --window-size=1280,800 --screenshot="$(basename $site).png" $site
done

