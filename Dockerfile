FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV TINI_VERSION 0.10.0
ENV TINI_URL https://github.com/krallin/tini/releases/download/v$TINI_VERSION/tini


ADD ["https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/cleanimage", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get -y install \
      apt-transport-https \
      ca-certificates \
      curl \
      nano \
      unzip \
 && cleanimage

RUN curl -Lo "/usr/local/bin/tini" $TINI_URL \
 && chmod +x "/usr/local/bin/tini"

RUN curl -Lo "/usr/local/bin/my_init" "https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/my_init" \
 && chmod +x "/usr/local/bin/my_init" \
 && mkdir "/etc/my_init.d"

RUN curl -Lo "/usr/local/bin/appfolders" "https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/appfolders" \
 && chmod +x "/usr/local/bin/appfolders" \
 && echo "appfolders link &> /var/log/appfolders.log" > "/etc/my_init.d/000-link-appfolders" \
 && chmod +x "/etc/my_init.d/000-link-appfolders"

RUN cleanimage


ENTRYPOINT ["tini", "-g", "--", "my_init"]
