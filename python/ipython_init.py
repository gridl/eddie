# flake8: NOQA
# encoding: UTF-8

import os
import sys
import datetime
now = datetime.datetime.now()


# import_standard_library
try:
    from stdlib_list import stdlib_list

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

from datetime import *

from functools import *

from distutils.version import *
lv = LooseVersion

from packaging.version import *
v = Version

from pprint import pprint
pp = pprint

from unicodedata import *



# 3rd party libraries
try:

    import celery
    from celery import current_app, chain, chord, group
    from celery.task.control import revoke, inspect, discard_all

    import importmagic
    index = importmagic.SymbolIndex()
    index.get_or_create_index(name='py35', paths=['.'] + sys.path)

    import numpy as np
    import pandas as pd
    from pandas import DataFrame as df

    from pyflash.core import *

    import redis
    rc = redis.StrictRedis(host='localhost', port=6379, db=0)

    from t import *

except Exception as e:
    print(e)


# aliases
ty = type


# data
a = [12, 45, 78, 35, 98, 44, 65]
sa = [12, 35, 44, 45, 65, 78, 98]

l = [None, 3, 5.0, 'aaew', 23]
d = {1: 2, "a": "b", }
t = (1, "aaa", 4.5, None, )
s = {1, "333", "foo"}
b = [120, 3, 255, 0, 100]


beta = 'β'
gamma = ''
lh = 'http://0.0.0.0:8000'
email = 'anand21nanda@gmail.com'

c1 = """
import os
import sys

import sphinx_rtd_theme


print(os, sys, sphinx_rtd_theme)
"""


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


def bd(number):
    return int('0x{}'.format(number), 0)


def ch(number):
    return chr(int('0x{}'.format(number), 0))


def da(model):
    return model.objects.all().delete()


def dh(number):
    return int('0x{}'.format(number), 0)


def hb(number):
    return bin(int('0x{}'.format(number), 0))


def hd(number):
    return int('0x{}'.format(number), 0)

def dsu():
    try:
        u = User.objects.get(username='f')
    except:
        u = User.objects.create(username='f')

    u.set_password('f')
    u.is_staff = u.is_superuser = True
    u.save()



class Foo:
    bar = 1

    def test(self, *args, **kwargs):
        print(args, kwargs)

class Organism:
    pass


class Animal(Organism):
    pass


class Human(Animal):
    pass



# os.system('cls' if os.name == 'nt' else 'clear')

message = r"""
 ________________________________________
< Supercharged iPython shell launched... >
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"""
print(message)
