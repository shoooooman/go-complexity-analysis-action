# go-complexity-analysis-action

This action runs [go-complexity-analysis](https://github.com/shoooooman/go-complexity-analysis) with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to show complexities of golang functions.

## Inputs

### `github_token`

**Required** Github token of your repository to run go-complexity-analysis

### `cycloover`

Optional The flag `--cycloover` of go-complexity-analysis to show only functions with the Cyclomatic complexity > N (default: 10).

### `maintunder`

Optional The flag `--maintover` of go-complexity-analysis to show only functions with the Maintainability index < N (default: 20).

### `workdir`

Optional Working directory relative to the root directory.


## Example Usage
```yaml
on: pull_request

jobs:
  reviewdog:
    runs-on: ubuntu-latest
    name: complexity analysis
    steps:
    - uses: actions/checkout@v2
    - uses: shoooooman/go-complexity-analysis-action@v1
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        cycloover: 5
        maintunder: 30
        workdir: subdirectory/
```
