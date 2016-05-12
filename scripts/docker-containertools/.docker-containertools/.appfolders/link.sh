#!/bin/bash

if [ -f "appfolders.conf" ]
then
  cat appfolders.conf | while read line
  do
    appname=`echo ${line} | grep -oP '^"\K([^"]*)(?=" )|^\K([^ ]*)(?= )'`
    name=`echo ${line} | grep -oP ' "\K([^"]*)(?=" )| \K([^ ]*)(?= )'`
    source=`echo ${line} | grep -oP ' "\K([^"]*)(?="$)| \K([^ ]*)(?=$)'`

    echo "$appname"
    echo "$name"
    echo "$source"
  done
fi