import sys
import time


registry = {}


def register_class(target_class):
    registry[target_class.__name__] = target_class


class MetaRegistry(type):

    def __new__(meta, name, bases, class_dict):
        cls = type.__new__(meta, name, bases, class_dict)
        if name not in registry:
            register_class(cls)
        return cls


# class BaseClass(metaclass=MetaRegistry):
#     pass


class BaseClass():
    pass


class Foo(BaseClass):
    pass


class Bar(BaseClass):
    pass


class Baz(Bar):
    pass


def subclasses(cls, registry=None):
    if registry is None:
        registry = set()

    subs = cls.__subclasses__()

    for sub in subs:
        if sub in registry:
            return
        registry.add(sub)
        yield sub
        for sub in subclasses(sub, registry):
            yield sub


registry = {cls.__name__: cls for cls in subclasses(BaseClass)}
print(registry)


# if len(sys.argv) != 1:
#     while True:
#         print(registry)
#         time.sleep(1)
