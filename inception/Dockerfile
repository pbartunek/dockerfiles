FROM golang:alpine AS build-env
WORKDIR /go/src/app
RUN apk add --no-cache git ca-certificates
RUN git clone https://github.com/proabiral/inception .
RUN go get
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o inception

FROM alpine:edge AS pack-env
WORKDIR /
RUN apk add --no-cache upx
COPY --from=build-env /go/src/app/inception /
RUN upx --brute inception -oinception.upx

FROM scratch as scratch-packed
COPY --from=build-env /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=pack-env /inception.upx /inception
WORKDIR /data
ENTRYPOINT ["/inception"]
