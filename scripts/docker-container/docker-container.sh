#!/bin/bash

cd /usr/local/docker-container/

subcommand=$1
shift

if [[ -z `echo $subcommand | grep '^[^/]*/.*$'` ]]
then
  cd .docker-container/
  sh "${subcommand}.sh" "$@"
fi
