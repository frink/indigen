#!/bin/bash

# Run a command line with a hang timeout, which kills the child process if it
# doesn't produce a new line of output for $1 seconds.

# This script has to be a separate process (rather than just a shell function)
# so killing it doesn't kill the parent process.

source sources/functions.sh

if [ $# -lt 1 ]
then
  echo "Need timeout value" >&2
  exit 1
fi

trap "killtree $$" EXIT
TIMEOUT="$1"
shift
( "$@" ) | tee >(while read -t "$TIMEOUT" -n 32 i; do true; done; sleep 1; kill -TERM $$ 2>/dev/null )
