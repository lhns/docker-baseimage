#!/bin/bash

subcommand=$1
shift

if [[ -z `echo $subcommand | grep '^[^/]*/.*$'` ]]
then
  cd /usr/local/docker-container/
  cd .docker-container/
  sh "${subcommand}.sh" "$@"
fi
