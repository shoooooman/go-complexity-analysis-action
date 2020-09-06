# go-complexity-analysis-action

This action runs [go-complexity-analysis](https://github.com/shoooooman/go-complexity-analysis) with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to report complexities of golang functions in [Github Checks](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-status-checks).

<img width="875" alt="example1" src="https://user-images.githubusercontent.com/32924835/92326807-d7d0db00-f08f-11ea-940e-bdb9d6e81546.png">
<img width="867" alt="example2" src="https://user-images.githubusercontent.com/32924835/92326810-dc958f00-f08f-11ea-9f85-90365a63e8a1.png">
<img width="1023" alt="example3" src="https://user-images.githubusercontent.com/32924835/92326812-de5f5280-f08f-11ea-9185-70dc535a31e0.png">

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
