FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD scripts/docker-container /usr/local/docker-container

RUN chmod -R +x /usr/local/docker-container \
 && ln /usr/local/docker-container/docker-container.sh /usr/bin/docker-container


RUN apt-get update \
 && apt-get -y install \
      nano \
      unzip \
      wget \
 && docker-container cleanup


ENTRYPOINT docker-container init


VOLUME /usr/local/appdata
