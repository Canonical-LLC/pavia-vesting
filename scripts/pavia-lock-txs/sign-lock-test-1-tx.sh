#!/usr/bin/env bash

set -eux

thisDir=$(dirname "$0")
baseDir=$thisDir/..
tempDir=$baseDir/../temp
mainDir=$baseDir/..

signingKey=$1
inputFile=${2:- $mainDir/lock-test-1.body}
outFile=${3:- $mainDir/lock-test-1.signed}

$thisDir/generic-sign-tx.sh $signingKey $inputFile $outFile
