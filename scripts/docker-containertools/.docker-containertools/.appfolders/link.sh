#!/bin/bash

if [ -f "${program}/appfolders.conf" ]
then
  cat "${program}/appfolders.conf" | while read line
  do
    apppath=`echo ${line} | grep -oP '^"\K([^"]*)(?=" )|^\K([^ ]*)(?= )'`
    source=`echo ${line} | grep -oP ' "\K([^"]*)(?="$)| \K([^ ]*)(?=$)'`
    target="/usr/local/appdata/${apppath}"

    mkdir -p "${target}"
    cp -rfT "${source}" "${target}"
    rm -rf "${source}"
    ln -sfT "${target}" "${source}"
  done
fi
