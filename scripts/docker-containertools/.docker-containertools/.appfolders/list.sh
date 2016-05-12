#!/bin/bash

if [ -f "${program}/appfolders.conf" ]
then
  cat "${program}/appfolders.conf" | while read line
  do
    apppath=`echo ${line} | grep -oP '^"\K([^"]*)(?=" )|^\K([^ ]*)(?= )'`
    source=`echo ${line} | grep -oP ' "\K([^"]*)(?="$)| \K([^ ]*)(?=$)'`

    echo "${apppath} ${source}"
  done
fi