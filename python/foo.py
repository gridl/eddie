import time
import random


def dec(func):
    def _wrapper(*args, **kwargs):
        return func(*args, **kwargs)
    return _wrapper


@dec
def bar(x):
    time.sleep(10)
    return True
    random.choice([True, False])


def baz():
    x = 12

    y = bar(x)

    if y:
        return True
    else:
        return False
