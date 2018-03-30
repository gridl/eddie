import random


class Node(object):
    def __init__(self, data):
        self.data = data
        self.children = []

    def add_child(self, obj):
        self.children.append(obj)

    def __repr__(self):
        return '{} - {}'.format(self.data, [i for i in self.children])


root = Node('root')

for i in range(random.randint(0, 4)):
    child = Node(i)
    for j in range(random.randint(0, 4)):
        c = Node(j)
        for k in range(random.randint(2, 4)):
            c.children.append(Node(k))

        child.children.append(c)

    root.add_child(child)


from pprint import pprint; pprint(root.children)

count = 0


def node_count(root):
    if root is None:
        return 0

    nodes = 1

    for child in root.children:
        if child is not None:
            nodes += node_count(child)
    return nodes


print(node_count(root))
