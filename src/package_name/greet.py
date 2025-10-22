"""Module for greeting users.

This module provides functions to greet users.

Example:
    >>> from package_name.greet import say_hello
    >>> say_hello("Alice")
    'Hello, Alice!'
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


def say_goodbye(name: str) -> str:
    """Return a goodbye message.

    Bids farewell to the user by name.

    Example:
        >>> say_goodbye("Alice")
        'Goodbye, Alice!'
    """
    return f"Goodbye, {name}!"
