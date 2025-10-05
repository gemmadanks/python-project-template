"""Test the greet functions."""

import pytest
from package_name.greet import say_hello


@pytest.mark.parametrize(
    "input_name,expected_output", [("Alice", "Hello, Alice!"), ("Bob", "Hello, Bob!")]
)
def test_say_hello(input_name, expected_output):
    """Test the say_hello function."""
    assert say_hello(input_name) == expected_output
