#!/bin/sh -l

reviewdog -conf=./.reviewdog.yml -reporter=github-pr-review -level=info
