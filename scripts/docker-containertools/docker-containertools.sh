#!/bin/bash

subcommand=$1
shift

if [ -z `echo $subcommand | grep '^[^/]*/.*$'` ]
then
  export program="/usr/local/docker-containertools/.docker-containertools"
  exec "${program}/${subcommand}.sh" "$@"
fi
