#!/bin/sh -l

REVIEWDOG_CONFIG_PATH=https://raw.githubusercontent.com/shoooooman/go-complexity-analysis-action/master/.reviewdog.yml
curl $REVIEWDOG_CONFIG_PATH | cat > .reviewdog_complexity.yml
reviewdog -conf=./.reviewdog_complexity.yml -reporter=github-pr-review -level=info
