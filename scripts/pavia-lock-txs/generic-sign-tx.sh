#!/usr/bin/env bash

set -eux

signingKey=$1
inputFile=$2
outFile=$3

thisDir=$(dirname "$0")
baseDir=$thisDir/..
tempDir=$baseDir/../temp
mainDir=$baseDir/..

mkdir -p $tempDir

cardano-cli transaction sign \
   --tx-body-file $inputFile \
   --signing-key-file $signingKey \
   $BLOCKCHAIN \
   --out-file $outFile

echo "signed transaction and saved as $outFile"

cardano-cli transaction submit \
 $BLOCKCHAIN \
 --tx-file $outFile

echo "submitted transaction"
