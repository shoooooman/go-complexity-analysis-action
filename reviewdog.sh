#!/bin/sh -l

echo $GITHUB_ACTION_PATH
REVIEWDOG_CONFIG_PATH="$GITHUB_ACTION_PATH/.reviewdog.yml"
curl $REVIEWDOG_CONFIG_PATH | cat > .reviewdog_complexity.yml
reviewdog -conf=./.reviewdog_complexity.yml -reporter=github-pr-review -level=info
