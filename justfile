# -----------------------------------------------------------------------------
# 🧰 Python Project Template — Justfile
# -----------------------------------------------------------------------------
# Common developer commands for Poetry-based projects.
# Run `just <command>` (e.g., `just test`).
# -----------------------------------------------------------------------------

# Always use bash for consistency across OSes
set shell := ["bash", "-cu"]

# Default recipe (shown when running plain `just`)
default:
    @just --list

# Install dependencies (create/update virtualenv)
install:
    poetry install

# Update dependencies to latest allowed versions
update:
    poetry update

# Regenerate lock file
lock:
    poetry lock

# Lint (Ruff check)
lint:
    poetry run ruff check .

# Format (Ruff format)
format:
    poetry run ruff format .

# Type checking (Pyright)
type-check:
    poetry run pyright

# Run quick tests (exclude slow)
test:
    poetry run pytest -q -m "not slow" --doctest-modules --doctest-glob="*.py" --maxfail=1 --disable-warnings

# Run tests with verbose output (exclude slow)
test-vv:
    poetry run pytest -vv -m "not slow" --doctest-modules --doctest-glob="*.py" --maxfail=1 --disable-warnings

# Run full test suite with coverage
coverage:
    poetry run pytest --cov --cov-report=term-missing

# Build docs (MkDocs strict)
docs-build:
    poetry run mkdocs build --strict

# Serve docs locally
docs-serve:
    poetry run mkdocs serve -a localhost:8000

# Install pre-commit hooks
pre-commit-install:
    poetry run pre-commit install \
    && poetry run pre-commit install -t pre-push \
    && poetry run pre-commit install --hook-type commit-msg

# Run all pre-commit hooks
pre-commit:
    poetry run pre-commit run --all-files --hook-stage push

# Clean generated artifacts
clean:
    rm -rf .pytest_cache dist build .ruff_cache .mypy_cache site

# Build distribution (wheel + sdist)
build:
    poetry build
