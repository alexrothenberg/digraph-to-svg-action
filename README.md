# Digraph to SVG Github Action

Digraph to SVG runs graphviz to compile graphviz dot files into svg
files that can be rendered in a browser.

1. Install it as a [Github Action](https://github.com/features/actions)
2. Check in a digraph dot file named with the `.dot` extension
3. This action will create and commit a `.svg` file in the same directory with the base name (ie `my-graph.dot` -> `my-graph.svg`)

## An example

If you want this action to run on every pull request that changes a `*.dot` file create the following in your project as `.github/workflows/main.yml`

```
on:
  pull_request:
    paths:
      - "**.dot"

jobs:
  digraph_to_svg_job:
    runs-on: ubuntu-latest
    name: Create svg image from digraph .dot file
    steps:
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.head_ref }}
      - name: Digraph to SVG step
        id: digraph_to_svg
        uses: alexrothenberg/digraph-to-svg-action@v26
```

If you create a pull request that adds or updates a `.dot` file the action will run and you'll see a new commit in your pull like

![Example commit](example-commit.png)

# Contributing

Contributions are welcome as github pull requests at https://github.com/alexrothenberg/digraph-to-svg-action

# License

Licensed under MIT License. See [LICENSE](LICENSE) for more details.
