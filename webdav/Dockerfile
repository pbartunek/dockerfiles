FROM python:alpine
RUN pip install wsgidav cheroot
RUN mkdir -p /webdav/share && mkdir -p /srv/data/share
COPY start.sh /webdav/
WORKDIR /webdav/
ENTRYPOINT "/webdav/start.sh"
