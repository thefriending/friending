#!/bin/sh
command -v docker >/dev/null 2>&1 || { echo >&2 "The script requires 'docker' but it's not installed. Aborting."; exit 1; }

DIR=$(dirname "$(dirname "$(readlink -f "$0")")")
docker run --rm -it -p 8080:8080 -v "$DIR":/media --workdir /media node:slim sh build/serve.sh