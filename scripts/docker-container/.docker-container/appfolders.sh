#!/bin/bash

subcommand=$1
shift

if [[ -z `echo $subcommand | grep '^[^/]*/.*$'` ]]
then
  cd .appfolders/
  sh "${subcommand}.sh" "$@"
fi
