#!/usr/bin/env bash

set -eux

thisDir=$(dirname "$0")
baseDir=$thisDir/../
tempDir=$baseDir/../temp

mkdir -p $tempDir
$baseDir/hash-plutus.sh

validatorFile=$baseDir/vesting.plutus
benefactorAddress=addr1qx49wuqaa0j83z4y04nyltpcmf602f0afn5s84l7a9wnjryg090a5a6en7e483rh98d67efcenetg9xpr6fvv2llmhts837axc
scriptDatumHash=$1
output=$2
bodyFile=$3
scriptHash=$(cat $baseDir/$BLOCKCHAIN_PREFIX/vesting.addr)

changeOutput=$(cardano-cli-balance-fixer change --address $benefactorAddress $BLOCKCHAIN -o "$output")

extraOutput=""
if [ "$changeOutput" != "" ];then
  extraOutput="+ $changeOutput"
fi

cardano-cli transaction build \
    --alonzo-era \
    $BLOCKCHAIN \
    $(cardano-cli-balance-fixer input --address $benefactorAddress $BLOCKCHAIN) \
    --tx-out "$scriptHash + $output" \
    --tx-out-datum-hash $scriptDatumHash \
    --tx-out "$benefactorAddress + 1744798 lovelace $extraOutput" \
    --change-address $benefactorAddress \
    --protocol-params-file scripts/$BLOCKCHAIN_PREFIX/protocol-parameters.json \
    --out-file $bodyFile

echo "saved transaction to $bodyFile"
