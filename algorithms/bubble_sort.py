def bubble_sort(array):
    for passnum in range(len(array) - 1, 0, -1):
        for i in range(passnum):
            if array[i] > array[i + 1]:
                array[i], array[i + 1] = array[i + 1], array[i]


def bubble_sort2(array):
    swaps = True
    passes = len(array) - 1

    while passes > 0 and swaps:
        swaps = False
        for i in range(passes):
            if array[i] > array[i + 1]:
                array[i], array[i + 1] = array[i + 1], array[i]
                swaps = True
        passes -= 1


array = [4, 6, 1, 5, 8, 3, 8, 9, 1, 4, 12, 67, 1, 11, 16, 78, 12]
print(array)
# bubble_sort(array)
bubble_sort2(array)
print(array)
