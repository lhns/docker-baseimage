#!/bin/bash

cat appfolders.conf | while read line
do
  echo ${line}
done