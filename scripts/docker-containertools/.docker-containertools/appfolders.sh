#!/bin/bash

subcommand=$1
shift

if [ -z `echo $subcommand | grep '^[^/]*/.*$'` ]
then
  export program="${program}/.appfolders"
  exec "${program}/${subcommand}.sh" "$@"
fi
