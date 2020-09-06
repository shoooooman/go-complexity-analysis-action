#!/bin/sh -l

cd $GITHUB_WORKSPACE/$INPUT_WORKDIR || exit 1

REVIEWDOG_YML=$(cat << EOS
runner:
  govet:
    cmd: go vet -vettool=\$(which complexity) --cycloover=$INPUT_CYCLOOVER --maintunder=$INPUT_MAINTUNDER ./...
    errorformat:
      - "%f:%l: %m"
    level: info
EOS
)
echo "$REVIEWDOG_YML" > .reviewdog_complexity.yml

export REVIEWDOG_GITHUB_API_TOKEN="$INPUT_GITHUB_TOKEN"

echo "::group:: reviewdog: go vet -vettool=\$(which complexity) --cycloover=$INPUT_CYCLOOVER --maintunder=$INPUT_MAINTUNDER $INPUT_WORKDIR..."
reviewdog -conf=./.reviewdog_complexity.yml -reporter=github-pr-review -filter-mode=nofilter
echo '::endgroup::'
