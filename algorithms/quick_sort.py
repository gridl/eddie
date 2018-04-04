def quick_sort(array):
    if len(array) <= 1:
        return array

    smaller = []
    equal = []
    greater = []

    pivot = array[0]

    for number in array:
        if number < pivot:
            smaller.append(number)
        elif number == pivot:
            equal.append(number)
        else:
            greater.append(number)

    # print(pivot, smaller, equal, greater)
    return quick_sort(smaller) + equal + quick_sort(greater)



def partition(array, begin, end):
    pivot = begin

    for i in range(begin+1, end+1):
        if array[i] <= array[begin]:
            pivot += 1
            array[i], array[pivot] = array[pivot], array[i]
            print(array)
    array[pivot], array[begin] = array[begin], array[pivot]

    print(pivot, begin, end)
    print(array)
    return pivot



def quicksort(array, begin, end):
    def _quicksort(array, begin, end):
        if begin >= end:
            return
        pivot = partition(array, begin, end)
        # print(pivot)
        _quicksort(array, begin, pivot-1)
        _quicksort(array, pivot+1, end)
    return _quicksort(array, begin, end)


def quick_sort2(array):
    return quicksort(array, 0, len(array) - 1)


array = [4, 6, 1, 5, 8, 3, 8, 9, 1, 4, 12, 67, 1, 11, 16, 78, 12]
print(array)
print(quick_sort(array))

array = [4, 6, 1, 5, 8, 3, 8, 9, 1, 4, 12, 67, 1, 11, 16, 78, 12]
print(array)
quick_sort2(array)
print(array)
