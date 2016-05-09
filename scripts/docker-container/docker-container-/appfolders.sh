#!/bin/bash

subcommand=$1
shift

if [[ -z `echo $subcommand | grep '^[^/]*/.*$'` ]]
then
  cd appfolders-/
  exec "./${subcommand}.sh" "$@"
fi
