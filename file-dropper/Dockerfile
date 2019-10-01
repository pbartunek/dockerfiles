FROM php:7-apache-stretch

COPY app/ /var/www/html
COPY start.sh /

COPY php.ini "$PHP_INI_DIR/php.ini"

RUN cd /etc/apache2/mods-enabled \
  && ln -s ../mods-available/ssl.conf \
  && ln -s ../mods-available/ssl.load \
  && ln -s ../mods-available/socache_shmcb.load \
  && ln -s ../mods-available/rewrite.load \
  && cd /etc/apache2/sites-enabled \
  && ln -s ../sites-available/default-ssl.conf \
  && openssl req -new -x509 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -days 365 -nodes -subj "/C=PE/ST=Test/L=Test/O=Test Inc. /OU=IT Department/CN=test"

CMD /start.sh
