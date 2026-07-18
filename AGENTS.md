# AGENTS.md

This file applies to the entire repository. It is guidance for coding agents
working on this Python project template.

## Repository overview

- The distributable package uses a `src` layout and lives in
  `src/package_name/`.
- Unit tests live in `tests/unit/`; shared fixtures belong in
  `tests/conftest.py`.
- Documentation is built with MkDocs Material from `docs/`.
- Example notebooks live in `notebooks/`.
- Dependencies and environments are managed with `uv`; common tasks are
  exposed through the root `justfile`.
- Python 3.11 and newer are supported. `.python-version` selects Python 3.14
  for the default development environment.

This is a reusable template. Keep examples and configuration generic unless a
task explicitly asks to customize the template for a specific project.

## Working principles

- Make the smallest coherent change that satisfies the task.
- Preserve unrelated work in the working tree. Inspect `git diff` before and
  after editing, and do not revert changes you did not make.
- Follow the existing structure and naming conventions instead of introducing
  a second tool or parallel configuration.
- Add or update tests when behavior changes. Update user-facing documentation
  when public APIs, setup steps, or workflows change.
- Record architecturally significant decisions with an ADR based on
  `docs/architecture/adr/template.md`.

## Setup and commands

Install the complete development environment with:

```bash
uv sync --all-groups
```

Prefer the `just` recipes because they document the intended local workflow:

```bash
just test             # quick tests, excluding tests marked slow
just test-vv          # verbose quick tests
just coverage         # full pytest run with terminal coverage
just test-notebooks   # execute notebooks through nbmake
just lint             # Ruff checks
just format           # Ruff formatting
just type-check       # Pyright
just docs-build       # strict MkDocs build
just build            # build wheel and source distribution
just pre-commit       # all push-stage hooks
```

For a focused test while iterating, run pytest through `uv`, for example:

```bash
uv run pytest -q tests/unit/test_greet.py
uv run pytest -q tests/unit/test_greet.py::test_say_hello
```

Do not invoke tools from an unrelated global Python environment. If `just` is
not installed, run the corresponding `uv run ...` command from the `justfile`.

## Python code conventions

- Put production code under `src/package_name/`, not at the repository root.
- Use absolute imports from `package_name` in tests and consumer examples.
- Use four spaces, UTF-8, LF line endings, and a final newline, as configured in
  `.editorconfig`.
- Let Ruff determine formatting. Do not hand-format code against Ruff's output.
- Add type annotations to new or changed functions. Keep code compatible with
  every supported Python version (3.11 through 3.14), not only the version in
  `.python-version`.
- Follow the existing Google-style docstrings for public modules and functions.
  Examples in Python docstrings must be valid doctests because the quick test
  recipes collect doctests from `*.py` files.
- Keep the package importable after changes. Export names from
  `src/package_name/__init__.py` only when they are intentionally part of the
  top-level public API.

## Tests

- Place unit tests in `tests/unit/` and name files `test_*.py`.
- Use pytest idioms, including parametrization for compact input/output cases
  and fixtures in `tests/conftest.py` when they are shared.
- Test observable behavior rather than implementation details.
- Cover normal behavior and relevant edge or failure cases introduced by a
  change. Keep tests deterministic and independent of execution order.
- Run the narrowest relevant test during development, then run `just test` for
  code changes. Use `just coverage` when the change has broader impact.
- CI runs the full test suite on Linux, macOS, and Windows with Python
  3.11-3.14. Avoid platform-specific paths, shell assumptions, and timing-based
  assertions in Python code and tests.

## Dependencies and lockfiles

- Declare runtime and development dependencies in `pyproject.toml`; do not add
  `requirements.txt`, Poetry, or another environment manager.
- Use `uv add <package>` for runtime dependencies, `uv add --dev <package>` for
  development dependencies, and `uv add --group docs <package>` for docs-only
  dependencies.
- Commit the resulting `pyproject.toml` and `uv.lock` changes together.
- Use `uv lock` after a manual metadata change and `uv lock --upgrade` only when
  an upgrade is intended. Do not casually regenerate or broadly upgrade the
  lockfile for an unrelated task.

## Documentation and notebooks

- Keep documentation within the existing Diataxis sections: `tutorials/`,
  `how-to/`, `reference/`, and `explanation/`.
- Add new pages to `mkdocs.yml` when they should appear in navigation.
- Build docs with `just docs-build`; the build is strict and warnings fail CI.
- Keep API reference paths aligned with importable modules under
  `src/package_name/`.
- Notebook outputs are stripped by pre-commit. After changing a notebook, run
  `just test-notebooks` and do not commit execution output or local kernel
  metadata.
- `site/`, `dist/`, and `build/` are generated artifacts and must not be
  committed.

## Releases and commits

- Use Conventional Commit subjects such as `feat:`, `fix:`, `docs:`, `test:`,
  `refactor:`, `build:`, and `ci:` when asked to create commits.
- Release Please manages version bumps, release notes, and release metadata.
  Do not manually edit `CHANGELOG.md`, `.release-please-manifest.json`, or
  release version fields in `pyproject.toml`, `CITATION.cff`, and `uv.lock`
  unless the task is specifically about a release.
- Never commit secrets, local virtual environments, caches, coverage output, or
  generated documentation.

## Validation before handoff

Choose checks proportional to the change, but for a typical Python change run:

```bash
just format
just lint
just type-check
just test
```

Also run `just docs-build` for documentation or public API changes,
`just test-notebooks` for notebook changes, and `just build` for packaging
changes. Report which checks ran and clearly identify any check that could not
be run.
