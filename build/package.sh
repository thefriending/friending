#!/bin/sh
command -v zip >/dev/null 2>&1 || { echo >&2 "The script requires 'zip' but it's not installed. Aborting."; exit 1; }

## Filesystem
DIR=$(dirname "$(dirname "$(readlink -f "$0")")")
DIR_SRC="$DIR/src"
DIR_OUT="$DIR/!artifacts"

## Variables 
NAME="friending"
VERSION=$(cat "$DIR/build/VERSION")
RELEASE="$NAME-$VERSION.zip"

## Main
rm -rf "${DIR_OUT:?}"/*
mkdir -p "$DIR_OUT"
cd "$DIR_SRC/"

zip -r "$DIR_OUT/$RELEASE" .