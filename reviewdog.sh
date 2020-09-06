#!/bin/sh -l

REVIEWDOG_YML=$(cat << EOS
runner:
  govet:
    cmd: go vet -vettool=\$(which complexity) --cycloover=$INPUT_CYCLOOVER --maintunder=$INPUT_MAINTUNDER $INPUT_WORKDIR
    errorformat:
      - "%f:%l: %m"
    level: info
EOS
)
echo "$REVIEWDOG_YML" > .reviewdog_complexity.yml

export REVIEWDOG_GITHUB_API_TOKEN="$INPUT_GITHUB_TOKEN"

reviewdog -conf=./.reviewdog_complexity.yml -reporter=github-pr-review -level=info
