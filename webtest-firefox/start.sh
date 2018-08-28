#!/bin/bash

firefox-esr &

if [ -f /data/project/project.burp ]; then
  BurpSuitePro \
    --project-file=/data/project/project.burp
else
  BurpSuitePro \
    --config-file=/data/project.json \
    --project-file=/data/project/project.burp
fi

exec "$@"
