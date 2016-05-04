FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD main/src/sh/cleanimage.sh /bin/cleanimage


RUN apt-get update \
 && apt-get -y install \
      unzip \
      wget \
 && cleanimage
