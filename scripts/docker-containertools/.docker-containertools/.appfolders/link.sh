#!/bin/bash

if [ -f "appfolders.conf" ]
then
  cat appfolders.conf | while read line
  do
    appname=`echo ${line} | grep -oP '^"\K([^"]*)(?=" )|^\K([^ ]*)(?= )'`
    name=`echo ${line} | grep -oP ' "\K([^"]*)(?=" )| \K([^ ]*)(?= )'`
    source=`echo ${line} | grep -oP ' "\K([^"]*)(?="$)| \K([^ ]*)(?=$)'`
    target="/usr/local/appdata/${appname}/${name}/"

    echo "$appname"
    echo "$name"
    echo "$source"

    mkdir "${target}"
    cp -rf "${source}" "${target}"
    ln "${target}" "${source}"
  done
fi