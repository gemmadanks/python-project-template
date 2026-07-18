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

# Install all dependencies (including dev + docs groups)
install-all:
    uv sync --all-groups   # include dev + docs groups (matches CI)

# Install development dependencies (create/update virtualenv)
install-dev:
    uv sync --dev

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

# Verify formatting without changing files
format-check:
    uv run ruff format --check .

# Type checking (Pyright)
type-check:
    uv run pyright

# Run quick tests (exclude slow)
test:
    uv run pytest -q -m "not slow" --doctest-modules --doctest-glob="*.py" --maxfail=1 --disable-warnings

# Run tests with verbose output (exclude slow)
test-vv:
    uv run pytest -vv -m "not slow" --doctest-modules --doctest-glob="*.py" --maxfail=1 --disable-warnings

# Run the fast, non-mutating handoff checks
check: format-check lint type-check test

# Test notebooks
test-notebooks:
    uv run pytest --nbmake notebooks/

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

# Build, install, and import the package in a clean temporary environment
package-smoke-test:
    uv run --no-sync python scripts/package_smoke_test.py

# Run the comprehensive local equivalent of CI (excluding its OS/Python matrix)
ci: pre-commit coverage docs-build package-smoke-test

# Start Jupyter lab from inside a container
jupyter-devcontainer:
    uv run jupyter lab --allow-root --ip 0.0.0.0 --no-browser
