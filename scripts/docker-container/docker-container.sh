#!/bin/bash

subcommand=$1
shift

if [[ -z `echo $subcommand | grep '^[^/]*/.*$'` ]]
then
  cd /usr/local/docker-container/docker-container-/
  sh "${subcommand}.sh" "$@"
fi
