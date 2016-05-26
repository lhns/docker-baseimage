FROM debian:jessie
MAINTAINER LolHens <pierrekisters@gmail.com>


ADD ["https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/cleanimage", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN apt-get update \
 && apt-get -y install \
      nano \
      unzip \
      wget \
 && cleanimage

ADD ["https://github.com/krallin/tini/releases/download/v0.9.0/tini", "/usr/local/bin/"] \
RUN chmod +x "/usr/local/bin/tini"

COPY ["bin/my_init", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/my_init" \
 && mkdir "/etc/my_init.d"

ADD ["https://raw.githubusercontent.com/LolHens/docker-tools/master/bin/appfolders", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/appfolders" \
 && echo "appfolders link &> /var/log/appfolders.log" > "/etc/my_init.d/link-appfolders" \
 && chmod +x "/etc/my_init.d/link-appfolders"

RUN cleanimage


ENTRYPOINT ["tini", "-g", "--", "my_init"]
