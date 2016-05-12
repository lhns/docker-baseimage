FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD ["scripts/docker-containertools", "/usr/local/docker-containertools"]

RUN chmod -R +x /usr/local/docker-containertools/ \
 && ln /usr/local/docker-containertools/docker-containertools.sh /usr/bin/docker-containertools


RUN apt-get update \
 && apt-get -y install \
      nano \
      unzip \
      wget \
 \
 && wget -P /tmp https://github.com/krallin/tini/releases/download/v0.9.0/tini \
 && chmod +x /tmp/tini \
 && mv /tmp/tini /usr/bin/ \
 \
 && docker-containertools cleanup


ENTRYPOINT ["/usr/bin/tini", "-g", "--"]


VOLUME ["/usr/local/appdata"]

