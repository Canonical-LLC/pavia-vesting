#!/usr/bin/env bash

set -eux

thisDir=$(dirname "$0")
baseDir=$thisDir/..
rootDir=$baseDir/..
tempDir=$baseDir/../temp

$thisDir/generic-lock-tx.sh \
  $(cat $rootDir/paviaDatum1-hash.txt) \
  '1700000 lovelace + 36 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941' \
  lock-test-1.body
