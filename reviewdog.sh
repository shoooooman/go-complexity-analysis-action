#!/bin/sh -l

cd $GITHUB_WORKSPACE/$INPUT_WORKDIR || exit 1

export REVIEWDOG_GITHUB_API_TOKEN="$INPUT_GITHUB_TOKEN"

echo "::group:: reviewdog: go vet -vettool=\$(which complexity) --cycloover=$INPUT_CYCLOOVER --maintunder=$INPUT_MAINTUNDER $INPUT_WORKDIR..."
go vet -vettool=\$(which complexity) --cycloover=$INPUT_CYCLOOVER --maintunder=$INPUT_MAINTUNDER ./... \
    | reviewdog \
      -efm="%f:%l: %m" \
      -level=info \
      -reporter=github-pr-review
echo '::endgroup::'
