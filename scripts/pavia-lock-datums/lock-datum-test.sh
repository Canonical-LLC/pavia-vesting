set -eu
thisDir=$(dirname "$0")
mainDir=$thisDir/../..

(
cd $mainDir
cabal run -- vesting-sc datum \
  --beneficiary 91a742a895f32d6aac3feaeb2867c0060c4884d4793bd223478e740f \
  --portion "$(date -v+5M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --output paviaDatum1.json
)
