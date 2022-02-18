set -eu
thisDir=$(dirname "$0")
mainDir=$thisDir/../..

(
cd $mainDir
cabal run -- vesting-sc datum \
  --beneficiary $1 \
  --portion "$(date -v+12m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+13m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+14m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+15m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+16m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+17m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+18m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+19m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+20m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+21m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+22m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+23m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+24m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+25m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+26m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+27m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+28m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+29m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+30m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+31m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+32m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+33m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+34m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+35m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+36m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+37m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+38m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+39m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+40m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+41m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+42m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+43m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+44m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+45m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+46m '+%s'):16666666 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --portion "$(date -v+47m '+%s'):16666690 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.5041564941" \
  --output paviaDatum1.json
)
