import sys
import timeit

from t import add, dummy


try:
    count = int(sys.argv[1])
except:
    count = 1000

print(count)


start_time = timeit.default_timer()

while count:
    add.delay(1, 2)
    # dummy.delay()
    count -= 1

print(timeit.default_timer() - start_time)
