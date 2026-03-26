FROM alpine:latest

LABEL maintainer="kerta1n"

ARG SNAPCAST_VERSION=0.35.0-r0

# ENV HOST=""
# ENV SOUNDCARD=""

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
 && apk add --no-cache snapcast-client=${SNAPCAST_VERSION}

# ENTRYPOINT ["snapclient"]
# CMD ["-h $HOST", "-s $SOUNDCARD"]

CMD snapclient
