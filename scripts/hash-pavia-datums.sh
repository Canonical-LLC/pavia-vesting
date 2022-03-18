#!/usr/bin/env bash

set -eu

thisDir=$(dirname "$0")
rootDir=$thisDir/..

find $rootDir -maxdepth 1 -name "*.json" \
  -exec sh -c 'cardano-cli transaction hash-script-data --script-data-file "$1" > "${1%.*}-hash.txt"' sh {} \;
