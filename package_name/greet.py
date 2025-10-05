"""Module for greeting users.

This module provides functions to greet users.

Example:
    >>> from package_name.greet import say_hello
    >>> say_hello("Alice")
    'Hello, Alice!'

The module contains the following functions:

- `say_hello(name)` - Returns a greeting message for a given name.
"""


def say_hello(name: str) -> str:
    """Return a greeting message.

    Greets the user by name.

    Example:
        >>> say_hello("Alice")
        'Hello, Alice!'

    Args:
        name (str): The name of the person to greet.
    Returns:
        str: A message to say hello.
    """
    return f"Hello, {name}!"
