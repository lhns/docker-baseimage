#!/bin/bash

cd /usr/local/docker-containertools/

subcommand=$1
shift

if [ -z `echo $subcommand | grep '^[^/]*/.*$'` ]
then
  cd .docker-containertools/
  exec "./${subcommand}.sh" "$@"
fi
