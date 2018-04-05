#!/bin/bash

chromium --no-sandbox \
	--proxy-server=http://127.0.0.1:8080 &> /dev/null &
BurpSuitePro \
  --config-file=/data/project.json \
  --project-file=/data/project/project.burp &> /dev/null &
