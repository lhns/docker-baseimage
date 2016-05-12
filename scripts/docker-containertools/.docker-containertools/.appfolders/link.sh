#!/bin/bash

if [ -f "appfolders.conf" ]
then
  cat appfolders.conf | while read line
  do
    echo ${line}

  done
fi