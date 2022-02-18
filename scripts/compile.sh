set -eu
thisDir=$(dirname "$0")
mainDir=$thisDir/..

(
cd $mainDir
cabal run vesting-sc -- write --output scripts/vesting.plutus
)

$thisDir/hash-plutus.sh
