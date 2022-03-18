#!/usr/bin/env bash

set -eux

thisDir=$(dirname "$0")
baseDir=$thisDir/..
tempDir=$baseDir/../temp
rootDir=$baseDir/..

signingKey=$1
beneficiaryAddr=addr1qxg6ws4gjhej664v8l4wk2r8cqrqcjyy63unh53rg788grcemdck8se46maf65e5rtg0w2mkvy535wyzqj8p3vsclhlqc9sppr
oldDatumFile=$rootDir/paviaDatum1.json
oldDatumHash=$rootDir/paviaDatum1-hash.txt
newDatum=$rootDir/paviaDatum1.json
newDatumHash=$rootDir/paviaDatum1-hash.txt
unlockAmount=$2
leftOverAmount=$3

$baseDir/core/unlock-first-successfully-tx.sh \
  $beneficiaryAddr \
  $signingKey \
  $oldDatumFile \
  $oldDatumHash \
  $newDatum \
  $newDatumHash \
  $unlockAmount \
  $leftOverAmount
