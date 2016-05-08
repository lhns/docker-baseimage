FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD main/src/sh/cleanimage.sh /usr/bin/cleanimage

RUN chmod +x /usr/bin/cleanimage


RUN apt-get update \
 && apt-get -y install \
      unzip \
      wget \
 && cleanimage


VOLUME /usr/local/appdata
