FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD scripts/docker-container /usr/local/docker-container

RUN chmod -R +x /usr/local/docker-container
RUN ln /usr/local/docker-container/docker-container /usr/bin/docker-container


RUN apt-get update \
 && apt-get -y install \
      nano \
      unzip \
      wget \
 && docker-container cleanup


VOLUME /usr/local/appdata
