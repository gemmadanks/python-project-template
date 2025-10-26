# -----------------------------------------------------------------------------
# 🧰 Python Project Template — Justfile
# -----------------------------------------------------------------------------
# Common developer commands for uv-based projects.
# Run `just <command>` (e.g., `just test`).
# -----------------------------------------------------------------------------

# Always use bash for consistency across OSes
set shell := ["bash", "-cu"]

# Default recipe (shown when running plain `just`)
default:
    @just --list

# Install dependencies (create/update virtualenv)
install:
    uv sync

# Update dependencies to latest allowed versions
update:
    uv lock --upgrade

# Regenerate lock file
lock:
    uv lock

# Lint (Ruff check)
lint:
    uv run ruff check .

# Format (Ruff format)
format:
    uv run ruff format .

# Type checking (Pyright)
type-check:
    uv run pyright

# Run quick tests (exclude slow)
test:
    uv run pytest -q -m "not slow" --doctest-modules --doctest-glob="*.py" --maxfail=1 --disable-warnings

# Run tests with verbose output (exclude slow)
test-vv:
    uv run pytest -vv -m "not slow" --doctest-modules --doctest-glob="*.py" --maxfail=1 --disable-warnings

# Run full test suite with coverage
coverage:
    uv run pytest --cov --cov-report=term-missing

# Build docs (MkDocs strict)
docs-build:
    uv run --group docs mkdocs build --strict

# Serve docs locally
docs-serve:
    uv run --group docs mkdocs serve -a localhost:8000

# Install pre-commit hooks
pre-commit-install:
    uv run pre-commit install \
    && uv run pre-commit autoupdate --repo https://github.com/pre-commit/pre-commit-hooks \
    && uv run pre-commit install -t pre-push \
    && uv run pre-commit install --hook-type commit-msg

# Run all pre-commit hooks
pre-commit:
    uv run pre-commit run --all-files --hook-stage push

# Clean generated artifacts
clean:
    rm -rf .pytest_cache dist build .ruff_cache .mypy_cache site

# Build distribution (wheel + sdist)
build:
    uv build
