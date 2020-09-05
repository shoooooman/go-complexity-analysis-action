#!/bin/sh -l

go vet -vettool=$(which complexity) . | reviewdog -efm="%f:%l: %m" -reporter=github-pr-review -level=info
