import main
import pytest

def test_greet():
    assert main.greet("World") == "Hello, World!"

def test_greet_name():
    assert main.greet("Bing") == "Hello, Bing!"
