class MinHeap:

    def __init__(self):
        self.array = []

    def __len__(self):
        return len(self.array)

    def peek_min(self):
        return self.array[0] if self.array else None

    def insert(self, key):
        if key is None:
            raise TypeError('key cannot be none')
        self.array.append(key)
        self._bubble_up(index=len(self.array) - 1)

    def _bubble_up(self, index):
        if index == 0:
            return
        parent_index = (index - 1) // 2
        if self.array[index] < self.array[parent_index]:
            self.array[index], self.array[parent_index] = self.array[parent_index], self.array[index]
            return self._bubble_up(parent_index)

    def extract_min(self):
        if not self.array:
            return None

        if len(self.array) == 1:
            return self.array.pop()

        minimum = self.array[0]
        # print(minimum)
        self.array[0] = self.array.pop(-1)
        self.bubble_down(index=0)

        return minimum

    def bubble_down(self, index):
        min_child_index = self._find_smaller_child(index)

        if min_child_index is None:
            return

        self.array[index], self.array[min_child_index] = self.array[min_child_index], self.array[index]

        return self.bubble_down(min_child_index)


    def _find_smaller_child(self, index):
        lc_index = 2 * index + 1
        rc_index = 2 * index + 2

        if lc_index >= len(self.array):
            return None

        if lc_index == len(self.array) - 1:
            return lc_index

        if self.array[lc_index] < self.array[rc_index]:
            return lc_index
        else:
            return rc_index
