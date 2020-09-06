#!/bin/sh -l

REVIEWDOG_YML=$(cat << EOS
runner:
  govet:
    cmd: go vet -vettool=\$(which complexity) --cycloover=$CYCLOOVER --maintunder=$MAINTUNDER ./...
    errorformat:
      - "%f:%l: %m"
    level: info
EOS
)
echo "$REVIEWDOG_YML" > .reviewdog_complexity.yml

reviewdog -conf=./.reviewdog_complexity.yml -reporter=github-pr-review -level=info
