"""Build and import the project package in a clean environment."""

from __future__ import annotations

import os
import subprocess
import tempfile
import tomllib
from pathlib import Path


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]


def run(command: list[str], *, environment: dict[str, str] | None = None) -> None:
    """Run a smoke-test command from the repository root."""
    subprocess.run(
        command,
        check=True,
        cwd=REPOSITORY_ROOT,
        env=environment,
    )


def package_module_name() -> str:
    """Return the importable module configured for the uv build backend."""
    pyproject_path = REPOSITORY_ROOT / "pyproject.toml"
    pyproject = tomllib.loads(pyproject_path.read_text(encoding="utf-8"))
    module_name = pyproject["tool"]["uv"]["build-backend"]["module-name"]

    if not isinstance(module_name, str) or not module_name:
        msg = "[tool.uv.build-backend].module-name must be a non-empty string"
        raise ValueError(msg)

    return module_name


def main() -> None:
    """Build a wheel, install its dependencies, and verify its top-level import."""
    module_name = package_module_name()

    with tempfile.TemporaryDirectory(prefix="package-smoke-") as temporary_dir:
        temporary_path = Path(temporary_dir)
        distribution_dir = temporary_path / "dist"
        virtual_environment = temporary_path / "venv"

        run(["uv", "build", "--out-dir", str(distribution_dir)])

        wheels = list(distribution_dir.glob("*.whl"))
        if len(wheels) != 1:
            msg = f"expected one wheel in {distribution_dir}, found {len(wheels)}"
            raise RuntimeError(msg)

        run(["uv", "venv", str(virtual_environment)])
        run(
            [
                "uv",
                "pip",
                "install",
                "--python",
                str(virtual_environment),
                str(wheels[0]),
            ]
        )

        environment = os.environ.copy()
        environment["PACKAGE_SMOKE_MODULE"] = module_name
        run(
            [
                "uv",
                "run",
                "--no-project",
                "--python",
                str(virtual_environment),
                "python",
                "-c",
                (
                    "import importlib, os; "
                    "module = importlib.import_module("
                    "os.environ['PACKAGE_SMOKE_MODULE']); "
                    "print(f'Imported {module.__name__} successfully')"
                ),
            ],
            environment=environment,
        )


if __name__ == "__main__":
    main()
