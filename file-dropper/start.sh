#!/bin/sh

rm /var/log/apache2/access.log

apachectl start

tail -f /var/log/apache2/access.log
