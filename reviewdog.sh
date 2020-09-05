#!/bin/sh -l

REVIEWDOG_CONFIG_PATH='https://raw.githubusercontent.com/shoooooman/go-complexity-analysis-action/master/.reviewdog.yml'
curl $REVIEWDOG_CONFIG_PATH | cat > .reviewdog.yml
reviewdog -conf=./.reviewdog.yml -reporter=github-pr-review -level=info
