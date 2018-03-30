class Trie:
    def __init__(self):
        self._end = '.'
        self.trie = {}

    def add_word(self, word):
        if self.find_word(word):
            return self.trie

        temp_trie = self.trie

        for letter in word:
            if letter in temp_trie:
                temp_trie = temp_trie[letter]
            else:
                temp_trie = temp_trie.setdefault(letter, {})

        temp_trie[self._end] = self._end


    def find_word(self, word):
        sub_trie = self.find_prefix(word)
        if sub_trie:
            return self._end in sub_trie

    def find_prefix(self, prefix):
        sub_trie = self.trie
        for letter in prefix:
            if letter in sub_trie:
                sub_trie = sub_trie[letter]
            else:
                return False
        return sub_trie


trie = Trie()


words = ['a', 'an', 'and']
words = ['a', 'it', 'the']
words = ['a', 'to', 'tea', 'ten', 'ted', 'i', 'inn', 'in', 'inter']

_ = [trie.add_word(word) for word in words]
from pprint import pprint; pprint(trie.trie)

print(trie.find_word("tea"))
print(trie.find_word("tom"))
print(trie.find_word("int"))

print(trie.find_prefix("int"))
print(trie.find_prefix("tom"))
