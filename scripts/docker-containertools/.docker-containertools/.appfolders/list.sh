#!/bin/bash

if [ -f "appfolders.conf" ]
then
  cat appfolders.conf | while read line
  do
    apppath=`echo ${line} | grep -oP '^"\K([^"]*)(?=" )|^\K([^ ]*)(?= )'`
    source=`echo ${line} | grep -oP ' "\K([^"]*)(?="$)| \K([^ ]*)(?=$)'`

    echo "${apppath} ${source}"
  done
fi