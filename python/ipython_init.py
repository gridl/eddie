# flake8: NOQA

import sys
import datetime


try:
    from stdlib_list import stdlib_list
    # import_standard_library
    version = sys.version[:3]
    libs = stdlib_list(version)

    for lib in libs:
        statement = 'import {}'.format(lib)

        try:
            exec(statement)
        except ImportError:
            pass
except:
    pass


# stdlib extra imports
from collections import *
from functools import *
from unicodedata import *
from pprint import pprint
pp = pprint
from distutils.version import LooseVersion
lv = LooseVersion
from packaging.version import Version



# 3rd party libraries
try:
    import celery
    from celery import chain, current_app, group
    from celery.task.control import revoke, inspect, discard_all

    import numpy as np
    import pandas as pd
except:
    pass



# useful variables
now = datetime.datetime.now()


# data
l = [None, 3, 5.0, 'aaew', 23]
d = {1: 2, "a": "b", }
t = (1, "aaa", 4.5, None, )
s = {1, "333", "foo"}

gamma = ''
beta = 'β'
lh = 'http://0.0.0.0:8000'
email = 'anand21nanda@gmail.com'


# utilities

def f(*args, **kwargs):
    print('sample function with {}, {}'.format(args, kwargs))

foo = f


def add(x, y):
    print('calculatin {} + {}'.format(x, y))
    return x + y


def codepoint(x):
    cp = 'U+%04x' % ord(x)
    return cp.upper()


def hb(number):
    return bin(int('0x{}'.format(number), 0))


def hd(number):
    return int('0x{}'.format(number), 0)


def dh(number):
    return int('0x{}'.format(number), 0)


def bd(number):
    return int('0x{}'.format(number), 0)


def ch(number):
    return chr(int('0x{}'.format(number), 0))


try:
    file_name = './scripts/dsp.py'
    exec(open(file_name).read())
    print('============== Executed {} ============'.format(file_name))
except:
    pass

print('============== Executed {} ============'.format(__file__))
