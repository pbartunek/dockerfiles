#!/bin/bash

chromium \
	--proxy-server=http://127.0.0.1:8080 &> /dev/null &

if [ -f /data/project/project.burp ]; then
  BurpSuitePro \
    --project-file=/data/project/project.burp &> /dev/null &
else
  BurpSuitePro \
    --config-file=/data/project/project.json \
    --project-file=/data/project/project.burp &> /dev/null &
fi
