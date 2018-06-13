FROM alpine:3.7 AS build-env
WORKDIR /
RUN apk add --no-cache wget gcc musl-dev make openssl-dev
RUN wget https://github.com/vanhauser-thc/THC-Archive/raw/master/Tools/amap-5.4.tar.gz \
  && tar xzf amap-5.4.tar.gz \
  && cd amap-5.4 \
  && ./configure --prefix=/opt/amap \
  && make \
  && make install

FROM alpine:3.7
RUN apk add --no-cache openssl
COPY --from=build-env /opt/amap /opt/amap
ENTRYPOINT ["/opt/amap/bin/amap"]
