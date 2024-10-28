# Clang formatter action

![GitHub release](https://img.shields.io/github/v/release/jayllyz/clang-format-action?sort=semver&logo=github)
[![GitHub Repo stars](https://img.shields.io/github/stars/jayllyz/clang-format-action?logo=github&style=flat)](https://github.com/jayllyz/clang-format-action)
![GitHub last commit](https://img.shields.io/github/last-commit/jayllyz/clang-format-action?logo=github)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square&logo=github&style=flat)
[![CI](https://github.com/Jayllyz/clang-format-action/actions/workflows/ci.yml/badge.svg)](https://github.com/Jayllyz/clang-format-action/actions/workflows/ci.yml)

This action runs clang-format on the latest commit.
Many clang-format alternatives exist, I know, but i wanted to learn how to write a GitHub action.

Also, i'll keep this updated with the latest alpine version and will try to add as many options as possible.

## Usage

Example workflow:

```yml
---
name: "Clang format"

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  format:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          ref: ${{ github.head_ref }}
          fetch-depth: 2

      - uses: jayllyz/clang-format-action@v1
        # Default options
        with:
          check: false
          style: file
          extensions: cpp,h,hpp,c
          clang-version: latest

      # commit the changes (if there are any)
      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v5
        with:
          commit_message: "chore(style): clang format files"
          branch: ${{ github.head_ref }}
...
```

## Options

You can read more about the options here : [clang style docs](https://clang.llvm.org/docs/ClangFormatStyleOptions.html).

| Option          | Description                                                                                                      | Default       |
|-----------------|------------------------------------------------------------------------------------------------------------------|---------------|
| `check`         | If true, will only check if the files are formatted correctly. If false, will format the files.                  | `false`       |
| `style`         | Style to use for formatting.  can be: `file`,`LLVM`,`GNU`,`Google`,`Chromium`,`Microsoft`,`Mozilla` or `Webkit`. | `file`        |
| `extensions`    | Comma-separated list of file extensions to check. Do not include the dot.                                        | `cpp,h,hpp,c` |
| `clang-version` | Specify the major version of clang to use.                                                                       | `latest`      |
| `base-ref`      | Base ref to run git-clang-format against.                                                                        | `HEAD^`       |

## Action Badge

```md
[![clang-format](https://github.com/<OWNER>/<REPOSITORY>/actions/workflows/<WORKFLOW_FILE_NAME>/badge.svg)](https://github.com/Jayllyz/clang-format-action)
```

## Credits

- [stefanzweifel/git-auto-commit-action](https://github.com/stefanzweifel/git-auto-commit-action)
- [actions/checkout](https://github.com/actions/checkout)
- [hcpsilva/clang-format-action](https://github.com/hcpsilva/clang-format-action)
- [Mavrikant/clang-format-action](https://github.com/Mavrikant/clang-format-action)

## License

[MIT License](LICENSE)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
