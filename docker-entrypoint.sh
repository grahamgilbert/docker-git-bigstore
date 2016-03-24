#!/bin/bash

DIR=/docker-entrypoint.d

if [[ -d "$DIR" ]]
then
  /bin/run-parts --exit-on-error --verbose --regex '\.(sh|rb)$' "$DIR"
fi

exec "$@"
