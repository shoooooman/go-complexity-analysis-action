#!/bin/sh -l

REVIEWDOG_CONFIG_PATH='https://raw.githubusercontent.com/shoooooman/go-complexity-analysis-action/master/.reviewdog.yml'
# REVIEWDOG_CONFIG=$(curl $GITHUB_ACTION_PATH)
reviewdog -conf=$GITHUB_ACTION_PATH -reporter=github-pr-review -level=info
