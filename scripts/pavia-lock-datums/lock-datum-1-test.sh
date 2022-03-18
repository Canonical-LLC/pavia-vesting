set -eu
thisDir=$(dirname "$0")
mainDir=$thisDir/../..

(
cd $mainDir
cabal run -- vesting-sc datum \
  --beneficiary 91a742a895f32d6aac3feaeb2867c0060c4884d4793bd223478e740f \
  --portion "$(date -v+12M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+13M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+14M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+15M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+16M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+17M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+18M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+19M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+20M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+21M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+22M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+23M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+24M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+25M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+26M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+27M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+28M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+29M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+30M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+31M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+32M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+33M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+34M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+35M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+36M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+37M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+38M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+39M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+40M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+41M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+42M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+43M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+44M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+45M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+46M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --portion "$(date -v+47M '+%s'):1 884892bcdc360bcef87d6b3f806e7f9cd5ac30d999d49970e7a903ae.PAVIA" \
  --output paviaDatum1-test.json
)
