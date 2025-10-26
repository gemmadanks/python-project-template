# Python Project Template
![Python Version from PEP 621 TOML](https://img.shields.io/python/required-version-toml?tomlFilePath=https%3A%2F%2Fraw.githubusercontent.com%2Fgemmadanks%2Fpython-project-template%2Frefs%2Fheads%2Fmain%2Fpyproject.toml)
[![codecov](https://codecov.io/gh/gemmadanks/python-project-template/graph/badge.svg?token=SJVFI32RHC)](https://codecov.io/gh/gemmadanks/python-project-template)
[![CI](https://github.com/gemmadanks/python-project-template/actions/workflows/ci.yaml/badge.svg?branch=main)](.github/workflows/ci.yaml)
[![release-please](https://github.com/gemmadanks/python-project-template/actions/workflows/release-please.yaml/badge.svg)](release-please-config.json)
[![Docs (GitHub Pages)](https://github.com/gemmadanks/python-project-template/actions/workflows/docs-pages.yaml/badge.svg)](https://github.com/gemmadanks/python-project-template/actions/workflows/docs-pages.yaml)
[![Docs (RTD)](https://app.readthedocs.org/projects/python-project-template/badge/?version=latest)](https://gemmadanks-python-project-template.readthedocs.io/en/latest/)
[![Dependabot](https://img.shields.io/github/issues-search?query=repo%3Agemmadanks%2Fpython-project-template%20is%3Apr%20author%3Aapp%2Fdependabot%20is%3Aopen&label=Dependabot%20PRs)](https://github.com/gemmadanks/python-project-template/issues?q=is%3Apr%20is%3Aopen%20author%3Aapp%2Fdependabot)
[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A comprehensive, opinionated template for modern Python projects -- featuring uv packaging, Ruff for linting and formatting, justfile, pytest testing with code coverage upload to codecov, MkDocs documentation with configuration for Read The Docs, pre-commit hooks, .editorconfig, .devcontainer, GitHub Actions CI, GitHub issue and pull request templates, architectural decision record (ADR) templates and automated semantic releases.

The goal is to help you start writing code immediately without having to spend time deciding what tools or conventions to use.

## How to use this template

1. 🌱 Create a New Repository on GitHub
    1. Click **["Use this template"](https://github.com/gemmadanks/python-project-template/generate)**.
    1.	Choose “Create a new repository”.
    1.	Pick a name for your new project (for example, `my-awesome-package`).
    1.	Clone your new repo locally
1. 🏡 Customise the repository
    1. Rename your package directory `mv package_name my_package`
    1. Update [pyproject.toml](pyproject.toml) with your package name, author, and description.
    1. Update all references to package_name in:
        - [package_name/tests/](package_name/tests/)
        - [docs/](docs/)
        - [release-please-config.json](release-please-config.json)
        - [GitHub Actions workflow](.github/workflows/ci.yaml)
        - This README (including badge links)
    1. Update the `"package-name"` field in [release-please-config.json](release-please-config.json) with your package name for automatically bumping the version number in [uv.lock](uv.lock) (see [release-please issue #2561](https://github.com/googleapis/release-please/issues/2561)).
    1. Customise this README with a description of your project and planned features.
    1. Customise the documentation configuration in [mkdocs.yml](mkdocs.yml) (see the [Material for MkDocs documentation](https://squidfunk.github.io/mkdocs-material/creating-your-site/#advanced-configuration) for details)

## 🚀 Features

- Python project directory structure
- README template with badges
- Packaging and dependency management via [uv](https://docs.astral.sh/uv/): [pyproject.toml](pyproject.toml)
- Linting and formatting via [Ruff](https://docs.astral.sh/ruff/): [.pre-commit-config.yaml](.pre-commit-config.yaml)
- Testing framework using [pytest](https://docs.pytest.org/en/stable/)
- CI using [GitHub Actions](https://docs.github.com/en/actions): [.github/workflows/ci.yaml](.github/workflows/ci.yaml)
    - [Pre-commit hooks](.pre-commit-config.yaml) (linting and formatting)
    - Automated tests
    - Package build with smoke test
- Templates for GitHub issues: bug report ([01-bug.yml](.github/ISSUE_TEMPLATE/01-bug.yml)) and feature request ([02-feature.yml](.github/ISSUE_TEMPLATE/01-feature.yml))
- Template for GitHub pull request: [.github/pull_request_template.md](.github/pull_request_template.md)
- Docs ([MkDocs](https://www.mkdocs.org/) + [mkdocstrings](https://mkdocstrings.github.io/)): [mkdocs.yml](mkdocs.yml)
    - Automated deployment to `gh-pages` branch via GitHub action: [.github/workflows/docs-pages.yaml](.github/workflows/docs-pages.yaml)
    - Configuration for Read The Docs integration: [.readthedocs.yaml](.readthedocs.yaml)
    - Template for [documenting architectural decisions](https://adr.github.io/): [docs/architecture/adr/template.md](docs/architecture/adr/template.md).
    - ADR to explain the rationale for using ADRs: [docs/architecture/adr/001-use-architectural-decision-records.md](docs/architecture/adr/001-use-architectural-decision-records.md).
- Release automation via GitHub action from [release-please](https://github.com/googleapis/release-please): [.github/release-please-config.json](.github/release-please-config.json)
- Citation metadata, automatically updated for each new release: [CITATION.cff](CITATION.cff)
- BSD-3-Clause: [LICENSE](LICENSE)
- [EditorConfig](https://editorconfig.org/) configuration for consistent coding style across editors: [.editorconfig](.editorconfig)

## 📦 Installation

### Working in a development container
A [Dockerfile](./devcontainer/Dockerfile) and [configuration](./devcontainer/devcontainer.json) in [./devcontainer](./devcontainer) can be used in VSCode or GitHub Codespaces to work in a pre-configured development environment. It uses a Python 3.14 base image and installs uv, just and all Python dependencies.

To open the project in the container VSCode, you will need to add the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and download [Docker](https://docs.docker.com/get-started/get-docker/) (or [Podman](https://podman.io/docs/installation) -- and [configure VSCode to use podman instead of Docker](https://code.visualstudio.com/remote/advancedcontainers/docker-options#_podman)) -- see the [VSCode tutorial on devcontainers](https://code.visualstudio.com/docs/devcontainers/tutorial) for more details on using devcontainers. Then run:
``` bash
Dev Containers: Reopen in Container
```

### Manual installation

1. [Install uv](https://docs.astral.sh/uv/getting-started/installation/)
1. Clone and install the project using uv:
```bash
git clone https://github.com/gemmadanks/python-project-template
cd python-project-template
uv sync --all-groups
```
1. [Install just](https://just.systems/man/en/packages.html).
1. Install pre-commit hooks (only needs to be done once)
```bash
just pre-commit-install
```
Hook definitions: [.pre-commit-config.yaml](.pre-commit-config.yaml)

## 🏁 Quickstart

```python
from package_name.greet import say_hello
print(say_hello("World"))
```

## 🧪 Common Tasks

Several common tasks have been added as recipes to a [justfile](justfile) in the root of the repository:

```bash
just install               # uv sync
just test                  # run quick (non-slow) tests
just lint                  # ruff check
just format                # ruff format
just type-check            # pyright type-check
just docs-serve            # live docs
just docs-build            # build docs
just pre-commit            # run all pre-commit hooks
just clean                 # remove generated files and folders
```

## 📚 Documentation

- Configuration: [mkdocs.yml](mkdocs.yml)
- Content pages (following the [Diátaxis framework](https://diataxis.fr/)):
    - [docs/index.md](docs/index.md)
    - [docs/reference.md](docs/reference.md) (autogenerated API documentation from docstrings via mkdocstrings).
    - [docs/tutorials.md](docs/tutorials.md)
    - [docs/explanation.md](docs/explanation.md)
- Architecture pages
    - Template for [documenting architectural decisions](https://adr.github.io/): [docs/architecture/adr/template.md](docs/architecture/adr/template.md).
    - ADR to explain the rationale for using ADRs: [docs/architecture/adr/001-use-architectural-decision-records.md](docs/architecture/adr/001-use-architectural-decision-records.md).
    - Index of ADRs: [docs/architecture/adr/index.md](docs/architecture/adr/index.md).

## 🔄 Releases

Managed by release-please: ([conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) drive [semantic versioning](https://semver.org/) and an autogenerated CHANGELOG).
    - Configuration: [.github/release-please-config.json](.github/release-please-config.json)
    - Version source: pyproject.toml

## 📂 Project Structure

```
.
├── src/
│   └── package_name/              # Source package
│       ├── __init__.py
│       └── greet.py               # Example module (replace with real code)
├── tests/                         # Test suite
│   ├── conftest.py
│   └── unit/
│       └── test_greet.py          # Example unit test (replace with real tests)
├── docs/                          # Documentation (Diátaxis layout)
│   ├── index.md                   # Documentation homepage
│   ├── tags.md                    # Tag index
│   ├── reference/
│   │   └── index.md               # API reference (mkdocstrings)
│   ├── tutorials/
│   │   └── index.md               # Tutorials overview
│   ├── how-to/
│   │   └── index.md               # How-to guides
│   ├── explanation/
│   │   └── index.md               # Conceptual guides
│   └── architecture/
│       ├── index.md               # Architecture overview
│       └── adr/                   # Architectural decision records
│           ├── index.md           # ADRs index
│           ├── template.md        # Template for new ADR
│           ├── 001-use-architectural-decision-records.md
│           └── 002-manage-dependencies-with-uv.md
├── notebooks/                     # Jupyter notebooks
│   └── example.ipynb
├── .github/
│   ├── workflows/
│   │   ├── ci.yaml                # Lint / test / build
│   │   └── release-please.yaml    # Automated releases
│   ├── ISSUE_TEMPLATE/            # Issue forms
│   │   ├── 01-bug.yml
│   │   └── 02-feature.yml
│   ├── pull_request_template.md   # Pull request template
│   └── dependabot.yml             # Dependency update automation
├── .pre-commit-config.yaml        # Pre-commit hook definitions
├── .devcontainer/                 # Dev container configuration
│   ├── devcontainer.json
│   └── Dockerfile
├── pyproject.toml                 # Project metadata + dependencies (uv)
├── uv.lock                        # Locked dependency versions (uv)
├── README.md                      # Project overview (you are here)
├── mkdocs.yml                     # MkDocs configuration
├── CITATION.cff                   # Citation metadata
├── LICENSE                        # License
├── CHANGELOG.md                   # Generated by release-please (post-release)
├── .release-please-manifest.json  # Release-please state
├── release-please-config.json     # Release-please configuration
├── .python-version                # pyenv version pin
├── justfile                       # justfile containing recipes for common tasks
├── .editorconfig                  # Ensures consistent code style across editors
└── .gitignore
```

## 🤝 Contributing

Use [conventional commit](https://www.conventionalcommits.org/) messages (feat:, fix:, docs:, etc.). Ensure:

- Lint & format clean
- Tests pass
- Docs build without warnings
- ADR drafted for architecturally significant changes

Suggestions and improvements to this template are very welcome — feel free to open an issue or pull request if you spot something that could be refined, added or removed.

## 📖 Citation

If used in research, cite via [CITATION.cff](CITATION.cff).

## 🛡 License

BSD-3-Clause – see [LICENSE](LICENSE).

Happy coding! 🚀
