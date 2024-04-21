FROM alpine:latest

LABEL maintainer="kerta1n"

ARG SNAPCAST_VERSION=0.28.0-r0

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk add --no-cache bash snapcast-client=${SNAPCAST_VERSION} sed

ENTRYPOINT ["snapclient"]
