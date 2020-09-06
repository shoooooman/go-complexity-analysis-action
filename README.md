# go-complexity-analysis-action

This action runs [go-complexity-analysis](https://github.com/shoooooman/go-complexity-analysis) with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to report complexities of golang functions in [Github Checks](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-status-checks).

<img width="1111" alt="example1" src="https://user-images.githubusercontent.com/32924835/92326601-5462ba00-f08e-11ea-88d1-782c69330446.png">
<img width="1409" alt="example2" src="https://user-images.githubusercontent.com/32924835/92326613-68a6b700-f08e-11ea-90da-cbe662cfb84d.png">
<img width="1228" alt="example3" src="https://user-images.githubusercontent.com/32924835/92326616-6b091100-f08e-11ea-8898-0d74714713cb.png">

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
