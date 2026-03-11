#!/bin/bash
set -e

echo "[entrypoint] args: $*"

# If compose passes a command, run it.
# If nothing passed, just open a shell.
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

exec sh